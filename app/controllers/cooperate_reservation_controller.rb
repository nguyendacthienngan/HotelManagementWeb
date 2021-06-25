class CooperateReservationController < ApplicationController
  def index
    @reservation = Reservation.all
  end
  def new
    @reservation = Reservation.new
    @search_result = {}
    @gender = @@gender
    @gender = convert_nested_hash_to_text(@gender)
  end
end
