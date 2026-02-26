class UserActivityCompletionsController < ApplicationController
  def mark_complete
    day_activity_id = params[:day_activity_id]
    user_id = params[:user_id]
    completion = UserActivityCompletion.find_by(user_id:, day_activity_id:)
    if completion
      # Error handling in app can give customizability to show dialog boxes
      # as an error or a regular dialog box
      return error_with_message("Activity already completed!", type: "INFO")
    end
    # TODO: Check for completion date vs day of program vs program started
    # date. If required to complete activity on ONLY that day then day should
    # be matching, else the checkbox should also be greyed out
    completion = UserActivityCompletion.new(user_id:, day_activity_id:, completed_at: Time.now, status: "completed")
    if completion.save
      ok_with_data({})
    else
      error_with_message("Activity could not be completed, please try again.", type: "ERROR")
    end
  end
end
