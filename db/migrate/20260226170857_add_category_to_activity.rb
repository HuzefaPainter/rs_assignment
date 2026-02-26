class AddCategoryToActivity < ActiveRecord::Migration[8.0]
  def change
    # null is true for testing purposes only
    add_reference :activities, :category, null: true, foreign_key: true
  end
end
