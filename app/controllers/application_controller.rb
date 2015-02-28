class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Added this to help with authentication
  # This makes the current user available in every view
  helper_method :current_owner
  # This finds the current owner
  def current_owner
  	Owner.where(id: session['owner_id']).first
  end
end
