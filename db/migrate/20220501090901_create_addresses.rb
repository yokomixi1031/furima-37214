class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,       null: false
      t.integer    :ship_from_area_id, null: false
      t.string     :municipalities,    null: false
      t.string     :address,           null: false
      t.string     :building_name
      t.string     :telephone,         null: false
      t.references :buyer,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
