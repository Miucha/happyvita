class ActivitiesController < ApplicationController
    before_action :set_activity, only: [:show]

    def index
        @activities = Activity.all
    end

    def show
    end

    def new
      @activity = Activity.new
    end

    def create
    end

    def edit
    end

    def update
    end

    def set_activity
        @activity = Activity.find(params[:id])
      end
end
