class CreateCardGroups < ActiveRecord::Migration
  def change
    create_table :card_groups do |t|
      t.belongs_to :card_reader, index: true
      t.belongs_to :card_reader_group, index: true	
                  
    end
  end
end