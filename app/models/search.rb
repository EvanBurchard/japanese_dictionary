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
  perfect_match = WordMeaning.all(:conditions => {:meaning => query}, :include => [{:word => :kanji_readings}, {:word => :kana_readings}, {:word => :parts},{:word => :word_meanings}, :word])
  w_m = WordMeaning.find(:all, :conditions => ["word_meanings.meaning LIKE ?", "%#{query}%"], :include => [{:word => :kanji_readings}, {:word => :kana_readings}, {:word => :parts},{:word => :word_meanings}], :limit => 100)
  if !w_m.blank? then
    w_m.compact
    w_m.uniq
  else
    nil
  end
end


def search_kanji_readings
  perfect_match = KanjiReading.all(:conditions => {:reading => query}, :include => [{:word => :kanji_readings}, {:word => :kana_readings}, {:word => :parts},{:word => :word_meanings}, :word])
  kanji_r = KanjiReading.all(:conditions => (["kanji_readings.reading LIKE ?", "%#{query}%"]), :order => "reading", :include => [{:word => :kanji_readings}, {:word => :kana_readings}, {:word => :parts},{:word => :word_meanings}, :word], :limit => 100)
  if !kanji_r.blank? then
    kanji_r.compact
    kanji_r.uniq
  else
    nil
  end
end

def search_kana_readings
  perfect_match = KanaReading.all(:conditions => {:reading => query}, :include => [{:word => :kanji_readings}, {:word => :kana_readings}, {:word => :parts},{:word => :word_meanings}, :word])
  kana_r = KanaReading.all(:conditions => (["kana_readings.reading LIKE ?", "%#{query}%"]), :order => "reading", :include => [{:word => :kanji_readings}, {:word => :kana_readings}, {:word => :parts},{:word => :word_meanings}, :word], :limit => 100)
  if !kana_r.blank? then
    kana_r.compact
    kana_r.uniq
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
