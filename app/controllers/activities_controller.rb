class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :cancel]

  def index
    if params[:query].present?
      sql_query = " \
        activities.title @@ :query \
        OR activities.description @@ :query \
        OR addresses.district @@ :query \
        OR addresses.city @@ :query \
        OR addresses.zipcode @@ :query \
      "
      @activities = Activity.joins(:address).where(sql_query, query: "%#{params[:query]}%")
    else
      @activities = Activity.all
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
    @activity.address = Address.find(params[:activity][:address])
    if @activity.save
      redirect_to @activity, notice: "Atividade criada com sucesso"
    else
      render :new
    end
  end

  def edit
    if current_user == @activity.owner
      render :edit
    else
      redirect_to @activity, notice: 'Esta atividade não foi criada por você.'
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
