require "application_system_test_case"

class DayActivitiesTest < ApplicationSystemTestCase
  setup do
    @day_activity = day_activities(:one)
  end

  test "visiting the index" do
    visit day_activities_url
    assert_selector "h1", text: "Day activities"
  end

  test "should create day activity" do
    visit day_activities_url
    click_on "New day activity"

    fill_in "Activity", with: @day_activity.activity_id
    fill_in "Integer", with: @day_activity.integer
    fill_in "Program day", with: @day_activity.program_day_id
    fill_in "Sort order", with: @day_activity.sort_order
    click_on "Create Day activity"

    assert_text "Day activity was successfully created"
    click_on "Back"
  end

  test "should update Day activity" do
    visit day_activity_url(@day_activity)
    click_on "Edit this day activity", match: :first

    fill_in "Activity", with: @day_activity.activity_id
    fill_in "Integer", with: @day_activity.integer
    fill_in "Program day", with: @day_activity.program_day_id
    fill_in "Sort order", with: @day_activity.sort_order
    click_on "Update Day activity"

    assert_text "Day activity was successfully updated"
    click_on "Back"
  end

  test "should destroy Day activity" do
    visit day_activity_url(@day_activity)
    click_on "Destroy this day activity", match: :first

    assert_text "Day activity was successfully destroyed"
  end
end
