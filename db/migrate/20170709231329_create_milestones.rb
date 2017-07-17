class CreateMilestones < ActiveRecord::Migration[5.0]
  def change
    create_table :milestones do |t|
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.string :type, null: false, default: "activity"
      t.references :location, null: false
      t.jsonb :details

      t.timestamps
    end
  end
end
