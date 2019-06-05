class PagesController < ApplicationController

  def dashboard
    @bookings = current_user.bookings
    @activities = current_user.activities
  end

  # def booked_activities
  #   @bookings = current_user.bookings
  # end

  # def offered_activities
  #   @activities = current_user.activities
  # end

end
