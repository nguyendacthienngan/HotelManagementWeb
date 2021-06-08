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
    @modal_title = "Đặt phòng nhanh"

    @room_name = Room.find(params[:room_id]).name
    @room_type_id = Room.find(params[:room_id]).room_type_id
    @room_type_name = RoomType.find(@room_type_id).name

    @room_price = RoomPrice.where(room_type_id: @room_type_id, price_type: 2).pluck(:price).to_s
    @room_price = @room_price.tr('[]', '')
    @room_price = helper.number_to_currency(@room_price, unit: "VND",  format: "%n %u")

    @payment_type = @@payment_type
    @payment_type_view = convert_nested_hash_to_text(@payment_type)

    @reservation_type = @@reservation_types
    @reservation_type_view = convert_nested_hash_to_text(@reservation_type)

    @reservation_type_chosen = nil

    #Payment
    @payment = Payment.new

    @reservation = Reservation.new


    #client_id = 1
    # employee_id = current_user.employee_id
    # room_id = params[:room_id]

  end

  def create_reservation
    # @reservation = Reservation.new(reservation_params)

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

  def create_payment
    # @payment = Payment.new(payment_params)

    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: "Payment was successfully created." }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end
end 
