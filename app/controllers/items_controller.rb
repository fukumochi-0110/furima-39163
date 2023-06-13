class ItemsController < ApplicationController
  before_action :basic_auth

  def index
  end

  def new
    if user_signed_in?
      render :new
    else
      redirect_to root_path
    end
  end

  def create
    
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
