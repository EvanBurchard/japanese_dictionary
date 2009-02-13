class KanaReading < ActiveRecord::Base
  belongs_to :word

def <=> (other)  
  reading.length <=> other.reading.length 
end  

end
