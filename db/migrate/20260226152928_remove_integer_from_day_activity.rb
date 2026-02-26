class RemoveIntegerFromDayActivity < ActiveRecord::Migration[8.0]
  def change
    remove_column :day_activities, :integer
  end
end
