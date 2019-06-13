class BookingsController < ApplicationController
  before_action :set_booking, except: [:create, :new]

#No update e no create os horários estão sendo colocados como 12PM por padrão,
#Para mudar precisa criar a opção de incluir horário nos forms

  def new
    @booking = Booking.new
    @activity = Activity.find(params[:activity_id])
  end

  def create
    @activity = Activity.find(params[:activity_id])

    @booking = @activity.event? ? Booking.new : Booking.new(booking_params)

    @booking.user = current_user
    @booking.activity = @activity

    #No update e no create os horários estão sendo colocados como 12PM por padrão,
    #Para mudar precisa criar a opção de incluir horário nos forms

    if @activity.event? then
      @booking.schedule_date = "#{I18n.l(@activity.event_date, format: "%d %B %Y")} 09:00:00 AM UTC"
      # @booking.schedule_date = @activity.event_date
    else
      @booking.schedule_date = "#{booking_params[:schedule_date].split.first} 09:00:00 AM UTC"
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
    #No update e no create os horários estão sendo colocados como 12PM por padrão,
    #Para mudar precisa criar a opção de incluir horário nos forms

    newdate = "#{params[:booking][:schedule_date].split.first} 09:00:00 AM UTC"
    params[:booking][:schedule_date] = newdate

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
