class CardGroup < ActiveRecord::Base
belongs_to :card_reader
belongs_to :card_reader_group
end