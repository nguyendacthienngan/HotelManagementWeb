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
    @room_price = RoomPrice.where(room_type_id: @room_type_id, price_type: 2).pluck(:price).to_s
    @room_price = @room_price.tr('[]', '')
    @room_price = helper.number_to_currency(@room_price, unit: "VND",  format: "%n %u")
  end
end 
