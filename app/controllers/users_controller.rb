class UsersController < ApplicationController

  def index
    @users = User.where.not(latitude: nil, longitude: nil)

    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

end