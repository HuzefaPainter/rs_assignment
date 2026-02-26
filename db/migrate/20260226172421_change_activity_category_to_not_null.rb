class ChangeActivityCategoryToNotNull < ActiveRecord::Migration[8.0]
  def change
    change_column_null :activities, :category_id, false
  end
end
