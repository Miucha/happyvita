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

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.owner = current_user
    @activity.address = Address.first
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

  def set_activity
      @activity = Activity.find(params[:id])
    end

  def activity_params
    params.require(:activity).permit(:title, :description, :event, :group, :event_date,
                                  :photo, :capacity, :confirmed)
    #falta :address
  end

  def cancel_params
    params.require(:activity).permit(:confirmed)
    #falta :address
  end
end
