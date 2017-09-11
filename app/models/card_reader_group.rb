class CardReaderGroup < ActiveRecord::Base
  validates :name, length: { in: 1..32 } 
end
