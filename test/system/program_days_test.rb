require "application_system_test_case"

class ProgramDaysTest < ApplicationSystemTestCase
  setup do
    @program_day = program_days(:one)
  end

  test "visiting the index" do
    visit program_days_url
    assert_selector "h1", text: "Program days"
  end

  test "should create program day" do
    visit program_days_url
    click_on "New program day"

    fill_in "Day", with: @program_day.day
    fill_in "Program", with: @program_day.program_id
    click_on "Create Program day"

    assert_text "Program day was successfully created"
    click_on "Back"
  end

  test "should update Program day" do
    visit program_day_url(@program_day)
    click_on "Edit this program day", match: :first

    fill_in "Day", with: @program_day.day
    fill_in "Program", with: @program_day.program_id
    click_on "Update Program day"

    assert_text "Program day was successfully updated"
    click_on "Back"
  end

  test "should destroy Program day" do
    visit program_day_url(@program_day)
    click_on "Destroy this program day", match: :first

    assert_text "Program day was successfully destroyed"
  end
end
