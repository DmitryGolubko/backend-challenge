class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end
end
