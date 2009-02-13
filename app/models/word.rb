class Word < ActiveRecord::Base  
  has_many :parts
  has_many :word_meanings
  has_many :kanji_readings
  has_many :kana_readings

def kanji_in_readings 
  kanji_arr = []
  self.kanji_readings.each do |kr|
    kr.reading.each do |r| 
      kanji_arr << (r.split '')
    end

    kanji_arr.flatten!
    kanji_arr.uniq!
    end
    kanji_arr.map! do |c|
      if Kanji.find_by_character(c)
        c
      end
    end
  kanji_arr.compact
end

end
