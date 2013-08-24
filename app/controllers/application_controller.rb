class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

private

def sort_column
  Organisation.column_names.include?(params[:sort]) ? params[:sort] : "id"
end

def sort_direction
  %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
end
