class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def error_with_message(message, type: nil)
    render json: {
      status: "error",
      data: {
        message:,
        type:
      }
    }
  end

  def ok_with_data(data)
    render json: {
      status: "ok",
      data:
    }
  end
end
