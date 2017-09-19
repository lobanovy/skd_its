class CardReaderGroup < ActiveRecord::Base
  has_many :cards
  has_many :card_groups
  has_many :card_readers, through: :card_groups
  validates :name, length: { in: 1..32 } 
end