class CalendarMailer < ApplicationMailer
  def welcome(activity)

        calendar = Icalendar::Calendar.new
        event = Icalendar::Event.new
        @user = params[:user]
        booking = @user.bookings.select { |booking| booking.activity_id == activity.id } unless @user.nil?
        event.dtstart = booking.first.schedule_date.strftime("%Y%m%dT%H%M%S")
        event.dtend = booking.first.schedule_date.strftime("%Y%m%dT%H%M%S")
        event.summary = activity.title
        event.description = activity.description
        event.location = 'Here !'
        event.created = activity.created_at
        event.last_modified = activity.updated_at
        event.uid = event.url = "#{event.url}"
        calendar.add_event(event)
        calendar.publish

        mail.attachments['activity.ics'] = { :mime_type => 'text/calendar', content:calendar.to_ical}
        mail(to: @user.email, subject: 'Confirmação de Atividade')
  end
end
