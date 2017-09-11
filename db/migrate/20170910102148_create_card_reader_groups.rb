class CreateCardReaderGroups < ActiveRecord::Migration
  def change
    create_table :card_reader_groups do |t|
      t.string :name, limit: 32, null: false
      
      t.timestamps
    end
  end
end
