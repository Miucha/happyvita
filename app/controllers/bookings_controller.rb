class BookingsController < ApplicationController
  before_action :set_booking, except: [:create, :new]

  def new
    @booking = Booking.new
    @activity = Activity.find(params[:activity_id])
  end

  def create
    @activity = Activity.find(params[:activity_id])

    @booking = @activity.event? ? Booking.new : Booking.new(booking_params)

    @booking.user = current_user
    @booking.activity = @activity

    if @activity.event? then
      @booking.schedule_date = @activity.event_date
    else
      @booking.schedule_date = booking_params[:schedule_date]
    end
    if @booking.save
      CalendarMailer.with(user: current_user).welcome(@activity).deliver_now
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
    activity = @booking.activity
    @booking.destroy
    redirect_to activity_path(activity)
  end

  def mark_as_done
    @booking.done = true
    @booking.save
    redirect_to activity_path(@booking.activity), notice: 'Parabéns! A atividade foi marcada como realizada.'
  end

  def add_review
    # if @booking.save
    #   redirect_to activity_path(@booking.activity), notice: 'Parabéns! Outros usuários ficarão felizes com a sua contribuição.'
    # else
    #   render :edit
    # end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
  #Acredito que abaixo não precise do :done, mas não verifiquei
    params.require(:booking).permit(:schedule_date, :done, :review_photo, :review_rate, :review_comment)
  end
end
