class CardReader < ActiveRecord::Base
  has_many :card_groups
  has_many :card_reader_groups, through: :card_groups
end
