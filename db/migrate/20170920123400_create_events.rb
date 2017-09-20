class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :address, limit: 15, null: false
      t.integer :time, unsigned: true, limit: 4, null: false
      t.integer :card_id, unsigned: true, limit: 4, null: false
      t.integer :time_end, unsigned: true, limit: 4, null: false
    end
  end
end
