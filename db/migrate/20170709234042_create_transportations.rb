class CreateTransportations < ActiveRecord::Migration[5.0]
  def change
    create_table :transportations do |t|
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.string :type, null: false
      t.references :start_location, null: false
      t.references :end_location, null: false
      t.string :distance
      t.string :estimated_cost

      t.timestamps
    end
  end
end
