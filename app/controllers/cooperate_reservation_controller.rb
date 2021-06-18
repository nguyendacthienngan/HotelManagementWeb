class CooperateReservationController < ApplicationController
  def index
    @reservation = Reservation.all
  end
  def new
    @reservation = Reservation.new


    @search_result = {}
  end
end
