class AdminController < ActionController::Base
  protect_from_forgery with: :exception

  layout 'application_admin'
end
