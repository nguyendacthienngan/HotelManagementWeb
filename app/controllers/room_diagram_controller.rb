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
    @payment = Payment.new
    @reservation = Reservation.new


    # #Khách lữ hành
    @reservation.client_id = 1
    # employee_id = current_user.employee_id
    @reservation.employee_id = current_user.employee_id
    # room_id = params[:room_id]
    @reservation.room_id = params[:room_id]
    @reservation.total = 100000
    @reservation.adults = 0
    @reservation.children = 0
    @reservation.payment_id = 1
    @reservation.arrival_date = Date.today
    @reservation.leave_date = Date.today
    @reservation.check_in_date = Date.today
    @reservation.created_at = Date.today
    @reservation.updated_at = Date.today
    @reservation.client_name = "Test"
    @reservation.client_citizen_id = "12350"
    # @reservation.id = 1


    @room_price = RoomPrice.where(room_type_id: @room_type_id, price_type: 2)
    @room_price = @room_price.pluck(:price).to_s
    @room_price = @room_price.tr('[]', '')
    @room_price = number_to_currency(@room_price, unit: "VND",  format: "%n %u")
  end

  def create
    @reservation = Reservation.new(reservation_params)
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
    # params.require(:reservation).permit(:status, :arrivalDate, :leaveDate, :checkInDate, :total)
    params.permit(:arrival_date, :leave_date, :client_name, :client_citizen_id, :children, :adults, :client_id, :employee_id, :room_id, :payment_id)
  end
end
