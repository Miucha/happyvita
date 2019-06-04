class ActivitiesController < ApplicationController
    before_action :set_activity, only: [:show]

    def index
        @activities = Activity.all
    end

    def show
    end

    def new
    end
    
    def create
    end

    def edit
        @activity = Activity.find(params[:id])
        if current_user && @activity.user
          render :edit
        else
          redirect_to @activity, notice: current_user != @activity.user ? 'Usuario indevido' : 'Esta atividade não foi criada por você.'
        end
    
    end

    def update
    end

    def set_activity
        @activity = Activity.find(params[:id])
      end
end
