class CreatePrograms < ActiveRecord::Migration[8.0]
  def change
    create_table :programs do |t|
      t.string :title, null: false
      t.integer :days, default: 30, null: false

      t.timestamps
    end
  end
end
