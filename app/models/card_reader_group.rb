class CardReaderGroup < ActiveRecord::Base
  has_many :card_readers
  validates :name, length: { in: 1..32 } 
end
