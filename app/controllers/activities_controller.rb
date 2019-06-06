class ActivitiesController < ApplicationController
    before_action :set_activity, only: [:show, :edit, :update, :cancel]

    def index
        @activities = Activity.all
    end

    def show
    end

    def new
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
      if current_user == @activity.user
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
