class IndividualReservationController < ApplicationController
  def index

  end

  def new
    @reservation = Reservation.new
    @room_name = Room.find(params[:room_id]).name
    @room_type_id = Room.find(params[:room_id]).room_type_id
    @room_type_name = RoomType.find(@room_type_id).name
    @payment_type = @@payment_type
    @payment_type_view = convert_nested_hash_to_text(@payment_type)
    @reservation_type = @@reservation_types
    @reservation_type_view = convert_nested_hash_to_text(@reservation_type)
    @reservation_type_chosen = nil

    @modal_title = "Đặt phòng nhanh"

    @room_price = RoomPrice.where(room_type_id: @room_type_id, price_type: 2)
    @room_price = @room_price.pluck(:price).to_s
    @room_price = @room_price.tr('[]', '')
    @room_price = number_to_currency(@room_price, unit: "VND",  format: "%n %u")
  end

  def show

  end
end
