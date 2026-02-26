class CreateUserPrograms < ActiveRecord::Migration[8.0]
  def change
    create_table :user_programs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :program, null: false, foreign_key: true
      t.datetime :start_date
      t.boolean :active

      t.timestamps
    end

    add_index :user_programs, [ :program_id, :user_id ], unique: true
  end
end
