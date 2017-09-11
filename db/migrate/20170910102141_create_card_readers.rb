class CreateCardReaders < ActiveRecord::Migration
  def change
    create_table :card_readers do |t|
      t.string :address, limit: 15, unique: true, null: false
      t.string :name, limit: 24, unique: true, null: false
      t.integer :card_reader_group_id, unsigned: true, limit: 1, null: false
      t.integer :failure_count, unsigned: true, limit: 1, default: 0

      t.timestamps
    end
  end
end
