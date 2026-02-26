class UserActivityCompletion < ApplicationRecord
  belongs_to :user
  belongs_to :day_activity
end
