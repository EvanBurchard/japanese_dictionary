class Search < ActiveRecord::Base
validates_presence_of :query, :message => nil

def search_by_query
  unless query.blank? or determine_script.blank?
    if determine_script == "english"
      search_english
    elsif determine_script == "kana"
      search_kana_readings
    elsif determine_script == "kana_and_kanji" or query.mb_chars.size > 1
      search_kanji_readings  
    elsif determine_script == "kanji"
      search_kanji  
    else
      nil
    end
  else
    nil
  end
end

def determine_script
  script_arr = []
  query.each_char do |c|
    if (c=~ /[a-zA-Z0-9]/)
      script_arr << "english"
    elsif (c =~ /[ぁ-ゞ゠-ヾ]/)
      script_arr << "kana"
    else  
      script_arr << "kanji"
    end
  end
  script_type(script_arr)
end


def script_type(script_arr)
  script_arr.uniq!
  if script_arr.include? ("english") and script_arr.size > 1 then
    nil
  else
    if script_arr.size > 1 then
      "kana_and_kanji"  
    else  
      script_arr[0]
    end
  end  
end


def search_english
  perfect_match = WordMeaning.all(:conditions => {:meaning => query})
  w_m = WordMeaning.find(:all, :conditions => ["word_meanings.meaning LIKE ?", "%#{query}%"], :limit => 20)
  if !w_m.blank? then
    words = w_m.map do |wm|
      wm.word
    end
    if !perfect_match[0].blank? and !perfect_match[0].word.blank? then 
      perfect_match.each do |m|
        words.insert(0, m.word)
      end
    end
    words.compact
    words.uniq
  else
    nil
  end
end


def search_kanji_readings
  perfect_match = KanjiReading.all(:conditions => {:reading => query}, :include => :word)
  kanji_r = KanjiReading.all(:conditions => (["kanji_readings.reading LIKE ?", "%#{query}%"]), :order => "reading", :include => :word)
  if !kanji_r.blank? then
    kanji_r.sort
    words = kanji_r.map do |kr|
      kr.word
    end
    if !perfect_match[0].blank? and !perfect_match[0].word.blank? then 
      perfect_match.each do |m|
        words.insert(0, m.word)
      end
    end
    words.compact
    words.uniq
  else
    nil
  end
end

def search_kana_readings
  perfect_match = KanaReading.all(:conditions => {:reading => query})
  kana_r = KanaReading.all(:conditions => (["kana_readings.reading LIKE ?", "%#{query}%"]), :order => "reading")
  if !kana_r.blank? then
    kana_r.sort
    words = kana_r.map do |kr|
      kr.word
    end
    if !perfect_match[0].blank? and !perfect_match[0].word.blank? then 
      perfect_match.each do |m|
        words.insert(0, m.word)
      end
    end
    words.compact
    words.uniq
  else
    nil
  end
end

def search_kanji
  Kanji.find(:first, :conditions => {:character=> query})
end


def self.recent_searches
  Search.all(:order => "created_at DESC", :limit => 15)
end

end
