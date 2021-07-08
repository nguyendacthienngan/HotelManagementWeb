include ActionView::Helpers::NumberHelper
class CooperateReservationController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_payment, only: %i[ show edit update destroy ]
  add_breadcrumb "Trang chủ", :root_path
  add_breadcrumb "Khách đoàn", :cooperate_reservation_index_path
  def index
    @payments = Payment.all
    @room_statuses = @@room_statuses
  end

  def show
    add_breadcrumb "Chi tiết đặt phòng"
    @room_statuses = @@room_statuses
  end

  def choose_rooms_post
    # Set session?
    session[:chosen_rooms] = params[:cooperate_reservation]
    redirect_to :controller => 'cooperate_reservation', :action => 'new'
  end
  def choose_rooms
    add_breadcrumb "Chọn phòng"
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
    add_breadcrumb "Chọn phòng", :cooperate_reservation_choose_rooms_path
    add_breadcrumb "Tạo đơn đặt phòng"
    @chosen_rooms = session[:chosen_rooms]["rooms"]
    @payment = Payment.new
    @payment_type = @@payment_type
    @payment_type_view = convert_nested_hash_to_text(@payment_type)
    @gender = @@gender
    @gender = convert_nested_hash_to_text(@gender)

    @arrival_date = session[:chosen_rooms]["arrival_date"]
    @leave_date = session[:chosen_rooms]["leave_date"]

    @room_types_json = []
    @room_prices = {}
    @adults_price = {}
    @children_price = {}
    @room_types = RoomType.all
    @room_types.each do |r_t|
      room_price = RoomPrice.where(room_type_id: r_t.id, price_type: 2).pluck(:price).to_s

      adults_price = RoomPrice.where(room_type_id: r_t.id, price_type: 6).pluck(:price).to_s
      adults_price = currency_name(adults_price)
      adults_price = currency_value(adults_price)

      children_price = RoomPrice.where(room_type_id: r_t.id, price_type: 7).pluck(:price).to_s
      children_price = currency_name(children_price)
      children_price = currency_value(children_price)

      if room_price
        @room_prices["#{r_t.name}"] = currency_name(room_price)
      end
      if children_price
        @children_price["#{r_t.name}"] = children_price
      end
      if adults_price
        @adults_price["#{r_t.name}"] = adults_price
      end
    end

  end

  def create
    @chosen_rooms = session[:chosen_rooms]["rooms"]
    @payment_type = @@payment_type
    @payment_type_view = convert_nested_hash_to_text(@payment_type)
    @gender = @@gender
    @gender = convert_nested_hash_to_text(@gender)

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

    @payment = Payment.new(payment_params)

    respond_to do |format|
      if @payment.save
        @chosen_rooms.each do |r|
          room_id = Room.where(name: r["id"]).pluck(:id)
          room_id = room_id.to_s
          room_id = room_id.tr('[]', '')

          @room = Room.find(room_id)
          @room.update(status: 2)
        end
        format.html { redirect_to @payment, notice: "Reservations were successfully created." }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
  def set_payment
    @payment = Payment.find(params[:id])
  end
  # Only allow a list of trusted parameters through.

  def payment_params
    params.permit(:description, :is_cooperate_reservation, :temp_total, :reservation_date, :deposit, :is_paid, :payment_type, :client_id,
                  :reservations_attributes => [:id, :arrival_date, :leave_date, :client_name, :client_citizen_id, :children, :adults, :employee_id, :room_id, :status, :reservation_type,:check_in_date],
                  :client_attributes => [:id, :name, :citizen_id, :gender, :nationality, :date_of_birth, :email, :client_type, :phone_number ])
    # params.permit(:price_type_id, :arrival_date, :leave_date, :client_name, :client_citizen_id, :children, :adults, :employee_id, :room_id, :status, :reservation_type,:check_in_date,
    #               payment_attributes:[:id, :temp_total, :reservation_date, :deposit, :is_paid, :payment_type, :client_id, :client_attributes => [:id, :name, :citizen_id, :gender, :nationality, :date_of_birth, :email, :client_type, :phone_number ]])
  end
end

