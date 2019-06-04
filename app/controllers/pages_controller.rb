class PagesController < ApplicationController

  def booked_activities
    @bookings = current_user.bookings
  end

  def offered_activities
    @activities = current_user.activities
  end

end
