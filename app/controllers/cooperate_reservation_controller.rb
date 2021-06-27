class CooperateReservationController < ApplicationController
  def index
    @reservation = Reservation.all
  end
  def new
    @reservation = Reservation.new
    @search_result = {}

    filter_room_type = params[:room_type_id]

    if filter_room_type
      @room_types = RoomType.where(id: filter_room_type)
    else
      @room_types = RoomType.all
    end

    arrival_date = params[:arrival_date]
    leave_date = params[:leave_date]

    if arrival_date
      @arrival_date = Time.parse(arrival_date).getutc
    else
      @arrival_date = Date.today
    end

    if leave_date
      @leave_date = Time.parse(leave_date).getutc
    else
      @leave_date = Date.today
    end

    #Xem lại trạng thái của đặt: Là đang đặt thôi chứ chưa nhận phòng?
    @unreserved_rooms = Reservation.where(["status = 1 and (arrival_date < ? and leave_date > ?)", "#{@arrival_date}", "#{@leave_date}"])
    @unreserved_rooms = @unreserved_rooms.pluck(:room_id)

    @rooms_status_2 = []
    @unreserved_rooms.each do |r|
      @rooms_status_2.push(Room.find(r))
    end

    @gender = @@gender
    @gender = convert_nested_hash_to_text(@gender)


  end
end
