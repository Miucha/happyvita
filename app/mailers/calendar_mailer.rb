class CalendarMailer < ApplicationMailer
  def welcome(activity)

        calendar = Icalendar::Calendar.new
        event = Icalendar::Event.new
        event.dtstart = activity.event_date.strftime("%Y%m%dT%H%M%S")
        event.dtend = activity.event_date.strftime("%Y%m%dT%H%M%S")
        event.summary = activity.title
        event.description = activity.description
        event.location = 'Here !'
        event.created = activity.created_at
        event.last_modified = activity.updated_at
        event.uid = event.url = "#{event.url}"
        calendar.add_event(event)
        calendar.publish

        @user = params[:user]
        mail.attachments['activity.ics'] = { :mime_type => 'text/calendar', content:calendar.to_ical}
        mail(to: @user.email, subject: 'Welcome')
  end
end
