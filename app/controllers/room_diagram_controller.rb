include ActionView::Helpers::NumberHelper

class RoomDiagramController < ApplicationController
  def index
    @search_types = {
      "Tên phòng" => "0",
      "Tầng" => "1",
      "Loại phòng" => "2"
    }
    @floors = [1,2,3]
    puts "Chosen Type"
    puts params[:chosen_type]
    puts "Name"
    puts params[:name]

    search_input = params[:name]
    chosen_type = params[:chosen_type]
    @rooms =
      if search_input
        if chosen_type
          if chosen_type == "0"
            Room.where('name LIKE ?', "%#{search_input}%")
          else
            if chosen_type == "1"
              Room.where(floor: search_input)
            else
              room_t_id = find_room_type_id(search_input)
              if (room_t_id != -1)
                Room.where(room_type_id: room_t_id)
              else
                Room.all
              end
            end
          end
        else
          Room.all
        end
      else
        Room.all
      end
  end

  def helper
    @helper ||= Class.new do
      include ActionView::Helpers::NumberHelper
    end.new
  end

  def find_room_type_id(room_type_name)
    room_type = RoomType.where(name: room_type_name)
    if (room_type)
      return room_type.pluck(:id)
    else
      return -1
    end
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




  def room_params
    params.require(:room).permit(:name, :chosen_type)
  end
end
