class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.belongs_to :card_reader_group, index: true
      t.integer :card_id, unsigned: true, limit: 4, null: false
      t.integer :time_end, unsigned: true, limit: 4, null: false
      t.integer :zone, unsigned: true, limit: 1, default: 0
      t.string :user_name, limit: 32, null: false
      t.boolean :enable, null: false, default: true 

      t.timestamps
    end
  end
end