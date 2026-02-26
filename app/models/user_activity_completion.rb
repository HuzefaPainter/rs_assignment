class UserActivityCompletion < ApplicationRecord
  belongs_to :user
  belongs_to :day_activity

  def self.get_completed_day_activity_ids(user_id, day_activity_ids)
    UserActivityCompletion
      .where(user_id:, day_activity_id: day_activity_ids)
      .pluck(:day_activity_id)
      .to_set
  end
end
