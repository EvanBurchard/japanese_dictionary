class Kanji < ActiveRecord::Base
  has_many :jumps
  has_many :kanji_readings, :through => :jumps
  has_many :kun_readings
  has_many :on_readings
  has_many :nanori_readings
  has_many :kanji_meanings

  def get_sorted_readings
    jumps = Jump.all(:conditions => {:kanji_id => self}, :order => "jump_quotient DESC", :include => :kanji_reading)
    jumps.map! do |j|
      j.kanji_reading
    end
    jumps.uniq
  end

end
