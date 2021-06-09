include ActionView::Helpers::NumberHelper

class RoomDiagramController < ApplicationController
  def index
    @floors = [1,2,3]
    @rooms = Room.all
  end

  def helper
    @helper ||= Class.new do
      include ActionView::Helpers::NumberHelper
    end.new
  end

  def quick_reserve_room

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

end
