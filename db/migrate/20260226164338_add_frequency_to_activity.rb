class AddFrequencyToActivity < ActiveRecord::Migration[8.0]
  def change
    add_column :activities, :frequency, :string
  end
end
