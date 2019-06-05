class PagesController < ApplicationController

  def dashboard
    @bookings = current_user.bookings
    @activities = current_user.activities
  end
  
end
