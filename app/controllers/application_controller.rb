class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include CartsHelper
  include SessionsHelper

  protect_from_forgery with: :exception
  
  before_action :current_cart
end
