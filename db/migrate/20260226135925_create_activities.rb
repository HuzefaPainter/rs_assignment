class CreateActivities < ActiveRecord::Migration[8.0]
  def change
    create_table :activities do |t|
      t.string :title, null: false
      t.text :description
      t.integer :duration_minutes, default: 5, null: false

      t.timestamps
    end
  end
end
