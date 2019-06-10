class UsersController < ApplicationController
  before_action :set_profile, only: [:profile, :edit_profile]

  def index
    @users = User.where.not(latitude: nil, longitude: nil)

    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude
      }
    end
  end

  def profile
  end

  def edit_profile
  end

  def update_profile
    @user = User.find(params[:id])

    @user.first_name = user_params[:first_name]
    @user.last_name = user_params[:last_name]
    @user.photo = user_params[:photo]

    if @user.save
        redirect_to users_profile_path(@user), notice: 'Perfil editado com sucesso.'
    else
        render :edit_profile
    end
  end
end

private

def set_profile
  @user = User.find(current_user.id)
end

def user_params
  params.require(:user).permit(:id, :first_name, :last_name, :photo)
end
