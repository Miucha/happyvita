class BookingsController < ApplicationController
  before_action :set_booking, except: [:create, :new]

  def new
    @booking = Booking.new
    @activity = Activity.find(params[:activity_id])
  end

  def create
    @booking = Booking.new(booking_params)
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

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to activity_path(@booking.activity), notice: 'Agendamento editado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:schedule_date, :check)
  end
end
