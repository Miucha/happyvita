class PagesController < ApplicationController

  def agenda
    @bookings = current_user.bookings
  end

  def dashboard
    @activities = current_user.activities
  end

end
