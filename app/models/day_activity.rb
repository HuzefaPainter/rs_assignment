class DayActivity < ApplicationRecord
  belongs_to :program_day
  belongs_to :activity

  def self.get_activities(program_day_id)
    DayActivity
      .joins(:activity)
      .joins("LEFT JOIN categories ON categories.id = activities.category_id")
      .where(program_day_id:)
      .order("day_activities.sort_order")
      .select("activities.id, activities.title, activities.duration, activities.frequency, categories.title as category_title, day_activities.id AS day_activity_id")
  end
end
