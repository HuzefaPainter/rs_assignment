class RenameDurationMinutesToDurationInActivity < ActiveRecord::Migration[8.0]
  def change
    rename_column :activities, :duration_minutes, :duration
  end
end
