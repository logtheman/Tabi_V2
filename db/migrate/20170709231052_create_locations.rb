class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.decimal :lat, :decimal, {:precision=>10, :scale=>6}, null: false
      t.decimal :lng, :decimal, {:precision=>10, :scale=>6}, null: false
      t.string :description
      t.string :formatted_address
      t.jsonb :address_components

      t.timestamps
    end
  end
end
