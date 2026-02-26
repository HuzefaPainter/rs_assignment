require "test_helper"

class ProgramDaysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program_day = program_days(:one)
  end

  test "should get index" do
    get program_days_url
    assert_response :success
  end

  test "should get new" do
    get new_program_day_url
    assert_response :success
  end

  test "should create program_day" do
    assert_difference("ProgramDay.count") do
      post program_days_url, params: { program_day: { day: @program_day.day, program_id: @program_day.program_id } }
    end

    assert_redirected_to program_day_url(ProgramDay.last)
  end

  test "should show program_day" do
    get program_day_url(@program_day)
    assert_response :success
  end

  test "should get edit" do
    get edit_program_day_url(@program_day)
    assert_response :success
  end

  test "should update program_day" do
    patch program_day_url(@program_day), params: { program_day: { day: @program_day.day, program_id: @program_day.program_id } }
    assert_redirected_to program_day_url(@program_day)
  end

  test "should destroy program_day" do
    assert_difference("ProgramDay.count", -1) do
      delete program_day_url(@program_day)
    end

    assert_redirected_to program_days_url
  end
end
