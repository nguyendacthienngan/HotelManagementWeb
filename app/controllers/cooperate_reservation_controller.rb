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
    @payment = Payment.new

    # @reservation = Reservation.new
    @payment_type = @@payment_type
    @payment_type_view = convert_nested_hash_to_text(@payment_type)
    @gender = @@gender
    @gender = convert_nested_hash_to_text(@gender)

    @chosen_rooms = session[:chosen_rooms]["rooms"]
    @arrival_date = session[:chosen_rooms]["arrival_date"]
    @leave_date = session[:chosen_rooms]["leave_date"]

    @room_types_json = []
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
    @payment = Payment.new

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


  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.

  def reservation_params
    params.require(:payment).permit(:id, :temp_total, :reservation_date, :deposit, :is_paid, :payment_type, :client_id,
    :reservation_attributes => [:arrival_date, :leave_date, :client_name, :client_citizen_id, :children, :adults, :employee_id, :room_id, :status, :reservation_type,:check_in_date],
    :client_attributes => [:id, :name, :citizen_id, :gender, :nationality, :date_of_birth, :email, :client_type, :phone_number ])
    # params.permit(:price_type_id, :arrival_date, :leave_date, :client_name, :client_citizen_id, :children, :adults, :employee_id, :room_id, :status, :reservation_type,:check_in_date,
    #               payment_attributes:[:id, :temp_total, :reservation_date, :deposit, :is_paid, :payment_type, :client_id, :client_attributes => [:id, :name, :citizen_id, :gender, :nationality, :date_of_birth, :email, :client_type, :phone_number ]])
  end
end

