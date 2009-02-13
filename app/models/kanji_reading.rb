class KanjiReading < ActiveRecord::Base  
  has_many :jumps
  has_many :kanjis, :through => :jumps
  belongs_to :word

def <=> (other)  
  reading.length <=> other.reading.length 
end  

end
