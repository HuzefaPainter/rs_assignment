require "test_helper"

class DayActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @day_activity = day_activities(:one)
  end

  test "should get index" do
    get day_activities_url
    assert_response :success
  end

  test "should get new" do
    get new_day_activity_url
    assert_response :success
  end

  test "should create day_activity" do
    assert_difference("DayActivity.count") do
      post day_activities_url, params: { day_activity: { activity_id: @day_activity.activity_id, integer: @day_activity.integer, program_day_id: @day_activity.program_day_id, sort_order: @day_activity.sort_order } }
    end

    assert_redirected_to day_activity_url(DayActivity.last)
  end

  test "should show day_activity" do
    get day_activity_url(@day_activity)
    assert_response :success
  end

  test "should get edit" do
    get edit_day_activity_url(@day_activity)
    assert_response :success
  end

  test "should update day_activity" do
    patch day_activity_url(@day_activity), params: { day_activity: { activity_id: @day_activity.activity_id, integer: @day_activity.integer, program_day_id: @day_activity.program_day_id, sort_order: @day_activity.sort_order } }
    assert_redirected_to day_activity_url(@day_activity)
  end

  test "should destroy day_activity" do
    assert_difference("DayActivity.count", -1) do
      delete day_activity_url(@day_activity)
    end

    assert_redirected_to day_activities_url
  end
end
