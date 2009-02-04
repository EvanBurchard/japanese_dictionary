require 'rexml/document'
require 'rexml/streamlistener'
include REXML
require 'rubygems'
require 'activerecord'
require 'activesupport'
$KCODE = 'u' 



ActiveRecord::Base.establish_connection(
  :adapter=>"mysql",
  :database=>"japanese_dictionary_development",
  :encoding=> "utf8"
)

class Jump < ActiveRecord::Base
  belongs_to :kanji
  belongs_to :kanji_reading
end

class Word < ActiveRecord::Base
  has_many :parts
  has_many :word_meanings
  has_many :kanji_readings
  has_many :kana_readings
end

class Kanji < ActiveRecord::Base
  has_many :jumps
  has_many :kanji_readings, :through => :jumps
end

class WordMeaning < ActiveRecord::Base
  belongs_to :word
end

class KanjiReading < ActiveRecord::Base
  has_many :jumps
  has_many :kanjis, :through => :jumps
  belongs_to :word
end

class KanaReading < ActiveRecord::Base
  belongs_to :word
end

class Part < ActiveRecord::Base
  belongs_to :word
end


class Listener
  include StreamListener

  @@element_stack = []
  def tag_start(name, attributes)
    if name=='entry' then
      @@w = Word.new
    end
    if name=='keb' then
      @@kr = KanjiReading.new
      @@kanjis = {}
    end

    @@element_stack.push((name + attributes.to_s).strip)
  end

  def text(text)
    current_element = @@element_stack.last
    if current_element=='keb' then
        #populate a kanji array
        characters = text.mb_chars.split //
        characters.each do |c|
          if !(c=~ /[ぁ-ゞ]/) and !(c=~ /[゠-ヾ]/) then
            @@kanjis[c] = 0
          end          
        end
        @@kanjis.each do |k, v|  
          @@kanjis[k] = text.scan(k).size/(text.mb_chars.size + text.mb_chars.index(k)*1.0)
        end
        
        #search each character in the db if char is legit kanji add jump to kr
        @@kanjis.each do |k, v|
          if Kanji.first(:conditions => {:character => k}) then
            @@jump = Jump.new(:kanji => Kanji.first(:conditions => {:character => k}), :jump_strength => v)
            if !@@jump.kanji.nil?  then
              @@kr.jumps << @@jump
              puts @@kr.jumps
              puts "Reading is #{text}"
              puts "Jump kanji is #{@@jump.kanji.character}"
              puts "Jump quotient is #{@@jump.jump_quotient}"
              puts ""
            end
          end
        end
        
        @@kr.reading = text        
        @@w.kanji_readings << @@kr

  end

    if current_element=='reb' then
      @@w.kana_readings << KanaReading.new(:reading =>text)
    end    
    if current_element=='pos' then
      @@w.parts << Part.new(:pos =>text)
    end    
    if current_element=='gloss' then
      @@w.word_meanings << WordMeaning.new(:meaning =>text)
    end

  end
  def tag_end(name)
    @@element_stack.pop
    if name == 'entry' then
      @@w.save!
    end
  end
end

listener = Listener.new
parser = Parsers::StreamParser.new(File.new("JMdict_e.xml"), listener)
parser.parse
