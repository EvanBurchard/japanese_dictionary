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

class Kanji < ActiveRecord::Base
  has_many :jumps
  has_many :kanji_readings, :through => :jumps
  has_many :kun_readings
  has_many :on_readings
  has_many :nanori_readings
  has_many :kanji_meanings
end

class KanjiMeaning < ActiveRecord::Base
  belongs_to :kanji
end

class KunReading < ActiveRecord::Base
  belongs_to :kanji
end

class OnReading < ActiveRecord::Base
  belongs_to :kanji
end

class NanoriReading < ActiveRecord::Base
  belongs_to :kanji
end


class Listener
  include StreamListener
  @@element_stack = []
  def tag_start(name, attributes)
    if name=='character' then
      @@k = Kanji.new
    end
    @@element_stack.push((name + attributes.to_s).strip)
  end
  def text(text)
    current_element = @@element_stack.last
    if current_element=='literal' then
      @@k.character = text
    end
    if current_element=='grade' then
      @@k.grade = text
    end
    if current_element=='stroke_count' then
      @@k.stroke_count = text
    end
    if current_element=='jlpt' then
      @@k.jlpt = text
    end
    if current_element=='freq' then
      @@k.frequency = text
    end
#multiples
    if current_element=='meaning' then
      @@k.kanji_meanings << KanjiMeaning.new(:meaning =>text)
    end
    if current_element=="nanori" then
      @@k.nanori_readings << NanoriReading.new(:reading =>text)
    end
    if current_element=='readingr_typeja_on' then
      @@k.on_readings << OnReading.new(:reading =>text)
    end
    if current_element=='readingr_typeja_kun' then
      @@k.kun_readings << KunReading.new(:reading =>text)
    end

  end
  def tag_end(name)
    @@element_stack.pop
    if name=='character' then
      puts "saving #{@@k}"
      @@k.save!
    end
  end
end

listener = Listener.new
parser = Parsers::StreamParser.new(File.new("kanjidic2.xml"), listener)
parser.parse
