include ActionView::Helpers::NumberHelper
class CooperateReservationController < ApplicationController
  def index
    @reservation = Reservation.all
  end
  def new
    @reservation = Reservation.new
    filter_room_type = params[:room_type_id]
    if filter_room_type
      @room_types = RoomType.where(id: filter_room_type)
    else
      @room_types = RoomType.all
    end
    @room_prices = {}
    @room_types.each do |r_t|
      room_price = RoomPrice.where(room_type_id: r_t.id, price_type: 2).pluck(:price)
      if room_price
        @room_prices["#{r_t.name}"] = currency_name(room_price.to_s)
      end
    end
    @payment_type = @@payment_type
    @payment_type_view = convert_nested_hash_to_text(@payment_type)
    @gender = @@gender
    @gender = convert_nested_hash_to_text(@gender)
  end

  def create
    @reservation = Reservation.new(reservation_params)
    filter_room_type = params[:room_type_id]
    if filter_room_type
      @room_types = RoomType.where(id: filter_room_type)
    else
      @room_types = RoomType.all
    end
    @room_prices = {}
    @room_types.each do |r_t|
      room_price = RoomPrice.where(room_type_id: r_t.id, price_type: 2).pluck(:price)
      if room_price
        @room_prices["#{r_t.name}"] = currency_name(room_price.to_s)
      end
    end
    @payment_type = @@payment_type
    @payment_type_view = convert_nested_hash_to_text(@payment_type)
    @gender = @@gender
    @gender = convert_nested_hash_to_text(@gender)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end
  def reservation_params
    params.permit(:price_type_id, :arrival_date, :leave_date, :client_name, :client_citizen_id, :children, :adults, :employee_id, :room_id, :status, :reservation_type,:check_in_date,
                  payment_attributes:[:id, :temp_total, :reservation_date, :deposit, :is_paid, :payment_type],
                  client_attributes:[:id, :name, :citizen_id, :gender, :nationality, :date_of_birth, :email, :client_type, :phone_number ])
  end
end
