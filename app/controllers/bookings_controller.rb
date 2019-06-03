class BookingsController < ApplicationController
  before_action :set_booking, except: :create

  def create
    @booking = Booking.new
    @booking.user = current_user
    @activity = Activity.find(params[:activity_id])
    @booking.activity = @activity
    @booking.check = false
    if @activity.event
      @booking.schdule_date = @activity.event_date
    else
      # criar forma de pegar data com caledário
      # @booking.schdule_date = ???
    end
    if @booking.save
      # encaminhar par o dashboard ??
    else
      # terá o caso de data incorreta??
      # render
    end

  end

  def update
    @activity = Activity.find(params[:activity_id])
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
