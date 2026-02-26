class CreateDayActivities < ActiveRecord::Migration[8.0]
  def change
    create_table :day_activities do |t|
      t.references :program_day, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true
      t.string :sort_order, default: 0, null: false
      t.string :integer

      t.timestamps
    end
  end
end
