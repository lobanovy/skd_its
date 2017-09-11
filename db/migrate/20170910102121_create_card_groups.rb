class CreateCardGroups < ActiveRecord::Migration
  def change
    create_table :card_groups do |t|
      t.string :name, limit: 32, null: false
      t.text :ip_addresses, null: false

      t.timestamps
    end
  end
end