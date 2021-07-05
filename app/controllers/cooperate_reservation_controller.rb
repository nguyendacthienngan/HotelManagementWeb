include ActionView::Helpers::NumberHelper
class CooperateReservationController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @reservation = Reservation.all
  end

  def show

  end

  def choose_rooms_post
    # Set session?
    session[:chosen_rooms] = params[:cooperate_reservation]
    puts "session[:chosen_rooms] = "
    puts session[:chosen_rooms]
    redirect_to :controller => 'cooperate_reservation', :action => 'new'
  end
  def choose_rooms

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
      @arrival_date = DateTime.now
    end

    if leave_date
      @leave_date = Time.parse(leave_date).getutc
    else
      @leave_date = DateTime.now
    end

    #Xem lại trạng thái của đặt: Là đang đặt thôi chứ chưa nhận phòng?
    @unreserved_rooms = Reservation.where(["status = 1 and (arrival_date < ? and leave_date > ?)", "#{@arrival_date}", "#{@leave_date}"])
    @unreserved_rooms = @unreserved_rooms.pluck(:room_id)

    @rooms_status_2 = []
    @unreserved_rooms.each do |r|
      @rooms_status_2.push(Room.find(r))
    end

    @room_prices = {}
    @room_types.each do |r_t|
      room_price = RoomPrice.where(room_type_id: r_t.id, price_type: 2).pluck(:price)
      if room_price
        @room_prices["#{r_t.name}"] = currency_name(room_price.to_s)
      end
    end
  end

  def new
    @reservation = Reservation.new
    @payment_type = @@payment_type
    @payment_type_view = convert_nested_hash_to_text(@payment_type)
    @gender = @@gender
    @gender = convert_nested_hash_to_text(@gender)

    @chosen_rooms = session[:chosen_rooms]["rooms"]
    @arrival_date = session[:chosen_rooms]["arrival_date"]
    @leave_date = session[:chosen_rooms]["leave_date"]

    @room_types_json = []
    # [{room_type: {id: 1, count: x, rooms: []  }}]
    # @chosen_rooms.each do |r|
    #   room_type = Room.where(:name => r["id"]).pluck(:room_type_id).to_s
    #   room_type = room_type.tr('[]', '')
    #   room_type = RoomType.find(room_type).name
    #
    #   #Tính số lượng
    #
    #   @room_types_json["#{room_type}"] = 0
    # end
    @room_prices = {}
    @room_types = RoomType.all
    @room_types.each do |r_t|
      room_price = RoomPrice.where(room_type_id: r_t.id, price_type: 2).pluck(:price)
      if room_price
        @room_prices["#{r_t.name}"] = currency_name(room_price.to_s)
      end
    end
  end

  def create
    @chosen_rooms = session[:chosen_rooms]["rooms"]

    @payment_type = @@payment_type
    @payment_type_view = convert_nested_hash_to_text(@payment_type)
    @gender = @@gender
    @gender = convert_nested_hash_to_text(@gender)

    @chosen_rooms = session[:chosen_rooms]["rooms"]
    @arrival_date = session[:chosen_rooms]["arrival_date"]
    @leave_date = session[:chosen_rooms]["leave_date"]

    @room_prices = {}
    @room_types = RoomType.all
    @room_types.each do |r_t|
      room_price = RoomPrice.where(room_type_id: r_t.id, price_type: 2).pluck(:price)
      if room_price
        @room_prices["#{r_t.name}"] = currency_name(room_price.to_s)
      end
    end

    # Test
    # first_room = @chosen_rooms[0]
    # room_id = Room.where(name: first_room["id"]).pluck(:id)
    # room_id = room_id.to_s
    # room_id = room_id.tr('[]', '')
    # reservation_params.merge(room_id: room_id) #IMPORTANT
    #
    # @reservation = Reservation.new(reservation_params)
    # @reservation.room_id = room_id
    # respond_to do |format|
    #   if !@reservation.save
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @reservation.errors, status: :unprocessable_entity }
    #   else
    #       format.html { redirect_to cooperate_reservation_index_path, notice: "Reservation was successfully created." }
    #       format.json { render :show, status: :created, location: @reservation }
    #   end
    # end
    if @chosen_rooms
      successFlag = true
      @chosen_rooms.each do |chosen_room|
        room_id = Room.where(name: chosen_room["id"]).pluck(:id)
        room_id = room_id.to_s
        room_id = room_id.tr('[]', '')
        reservation_params.merge(room_id: room_id) #IMPORTANT
        @reservation = Reservation.new(reservation_params)
        puts '-------------- ROOM ID: '
        puts room_id

        if !@reservation.save
          puts "FAILED"

          successFlag = false
          respond_to do |format|
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @reservation.errors, status: :unprocessable_entity }
          end
          break

        end
      end
      if successFlag == true
        respond_to do |format|
          format.html { redirect_to cooperate_reservation_index_path, notice: "Reservation was successfully created." }
        end
      end
      return
    end

  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reservation_params
    params.permit(:price_type_id, :arrival_date, :leave_date, :client_name, :client_citizen_id, :children, :adults, :employee_id, :room_id, :status, :reservation_type,:check_in_date,
                  payment_attributes:[:id, :temp_total, :reservation_date, :deposit, :is_paid, :payment_type, :client_id, :client_attributes => [:id, :name, :citizen_id, :gender, :nationality, :date_of_birth, :email, :client_type, :phone_number ]])
    # client_attributes:[:id, :name, :citizen_id, :gender, :nationality, :date_of_birth, :email, :client_type, :phone_number ])
  end
end

