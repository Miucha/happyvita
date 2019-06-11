class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index, :show]
  
  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
