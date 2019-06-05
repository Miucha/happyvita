class BookingsController < ApplicationController
  before_action :set_booking, except: [:create, :new]

  def new
    @booking = Booking.new
    @activity = Activity.find(params[:activity_id])
  end

  def create
    @booking = Booking.new
    @booking.user = current_user
    @activity = Activity.find(params[:activity_id])
    @booking.activity = @activity

    @booking.schedule_date = @activity.event_date if @activity.event

    if @booking.save
      redirect_to activity_path(@activity)
    else
      render :new
    end

  end

  def update
    unless @activity.event
      #forma de pegar a data do calendário
      # @booking.schdule_date = ??
    end
    if @activity.update
      # encaminhar par o dashboard ??
    else
      # terá o caso de data incorreta??
      # render
    end
  end

  def destroy

  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
