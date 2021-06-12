include ActionView::Helpers::NumberHelper

class RoomDiagramController < ApplicationController
  def index
    @floors = [1,2,3]
    @search_types = {
      "Tên phòng" => "0",
      "Tầng" => "1",
      "Loại phòng" => "2"
    }

    # Filter Switch Button
    @filter = params[:filter]
    @filters = switch_filter(@filter)


    # Search button
    search_input = params[:name]
    chosen_type = params[:chosen_type]


    @rooms = search_result(search_input, chosen_type)

    # Filter Room Status
    @room_statuses = @@room_statuses
    room_status = params[:room_status]
    @rooms = room_status_filter(room_status)

    @room_colors = convert_nested_hash_to_color(@@room_statuses)

    if @index
      @count_status = room_status_count(@index)
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

  def get_room_type_names
    room_types = RoomType.all
    results =  []
    if room_types
      # puts @result.inspect
      room_types.each do |r|
        temp = {}
        temp[:code] = r.id
        temp[:text] = r.name
        results.push(temp)
        # results[r.name] = r.id
      end
      return results
    else
      return -1
    end
  end

  def search_result(search_input, chosen_type)
    if search_input
      if chosen_type
        if chosen_type == "0"
          return Room.where('name LIKE ?', "%#{search_input}%")
        else
          if chosen_type == "1"
            return Room.where(floor: search_input)
          else
            room_t_id = find_room_type_id(search_input)
            if (room_t_id != -1)
              return Room.where(room_type_id: room_t_id)
            else
              return Room.all
            end
          end
        end
      else
        return Room.all
      end
    else
      return Room.all
    end
  end

  def switch_filter(filter)

    if (filter)
      if (filter == "1")
        @filters = @floors
      else
        @filters = get_room_type_names()
      end
    else
      @filters = @floors
    end

    return @filters
  end

  def room_status_filter(room_status)
    if (room_status)
      if (room_status == "all")
        return Room.all
      else
        return Room.where(status: room_status)
      end
    else
      return Room.all
    end
  end

  def room_status_count(room_status)
    if (room_status > 0)
      count = Room.where(status: room_status).count
      return count
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
    params.require(:room).permit(:name, :chosen_type, :filter, :room_status)
  end
end
