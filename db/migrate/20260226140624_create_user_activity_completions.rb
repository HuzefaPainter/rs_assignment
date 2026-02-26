class CreateUserActivityCompletions < ActiveRecord::Migration[8.0]
  def change
    create_table :user_activity_completions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :day_activity, null: false, foreign_key: true
      t.datetime :completed_at
      t.string :status

      t.timestamps
    end

    add_index :user_activity_completions,
      [ :user_id, :day_activity_id ],
      unique: true,
      name: "index_user_activity_unique"
  end
end
