class ActivitiesController < ApplicationController
  before_action :set_activity, except: [:index, :new_event, :new_challenge, :create]

  def index
    if params[:query].present?
      sql_query = " \
        activities.title @@ :query \
        OR activities.description @@ :query \
        OR addresses.district @@ :query \
        OR addresses.city @@ :query \
        OR addresses.zipcode @@ :query \
      "
      @activities = Activity.joins(:address).where(sql_query, query: "%#{params[:query]}%").where('confirmed = true')
      if current_user != nil && current_user.bookings != []
        @user_bookings = current_user.bookings
      end
    else
      @activities = Activity.where('confirmed = true')
      if current_user != nil && current_user.bookings != []
        @user_bookings = current_user.bookings
      end
    end
  end

  def show
  end

  def new_event
    @activity = Activity.new
  end

  def new_challenge
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.owner = current_user

    if @activity.event? then
      @activity.address = Address.find(params[:activity][:address])
      save_msg = "Evento criado com sucesso!"
    else
      @activity.address = Address.find(14)
      save_msg = "Desafio criado com sucesso!"
    end
    if @activity.save
      redirect_to @activity, notice: "#{save_msg}"
    else
      if @activity.event? then
        render :new_event
      else
        render :new_challenge
      end
    end
  end

  def edit_event
    if current_user == @activity.owner
      render :edit_event
    else
      redirect_to @activity, notice: 'Este evento não foi criado por você.'
    end
  end

  def edit_challenge
    if current_user == @activity.owner
      render :edit_challenge
    else
      redirect_to @activity, notice: 'Este desafio não foi criado por você.'
    end
  end

  def update
    @activity.update(activity_params)
    @activity.address = Address.find(params[:activity][:address])
    if @activity.save
        redirect_to @activity, notice: 'Atividade editada com sucesso.'
    else
        render :edit
    end
  end

  def cancel
    @activity.confirmed = false
    # @activity.update(cancel_params)
    if @activity.save
        redirect_to @activity, notice: 'Atividade cancelada com sucesso.'
    else
        render :edit
    end
  end

  private
  def set_activity
      @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:title, :description, :event, :group, :event_date,
                                      :photo, :capacity, :confirmed)
  end

  def cancel_params
    params.require(:activity).permit(:confirmed)
    #falta :address
  end
end
