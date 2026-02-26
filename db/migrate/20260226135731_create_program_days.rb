class CreateProgramDays < ActiveRecord::Migration[8.0]
  def change
    create_table :program_days do |t|
      t.references :program, null: false, foreign_key: true
      t.integer :day, null: false

      t.timestamps
    end

    add_index :program_days, [ :program_id, :day ], unique: true
  end
end
