class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]

  # GET /reservations or /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1 or /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    session[:reservation_params] ||= {}
    @reservation = Reservation.new
    @room_id = (params[:room_id])? params[:room_id] : 1
    if session[:reservation_params] == nil
      session[:reservation_params][:room_id] = @room_id
      # session[:reservation_params].deep_merge!(params[:room_id])
    end
    # puts "Sessions Params in New"
    # puts session[:reservation_params]
    # puts "ROOM ID IN NEW"
    # puts session[:reservation_params]["room_id"]

    @room_name = Room.find(@room_id).name
    @room_type_id = Room.find(@room_id).room_type_id
    @room_type_name = RoomType.find(@room_type_id).name
    @payment_type = @@payment_type
    @payment_type_view = convert_nested_hash_to_text(@payment_type)
    @reservation_type = @@reservation_types
    @reservation_type_view = convert_nested_hash_to_text(@reservation_type)


    @room_price = RoomPrice.where(room_type_id: @room_type_id, price_type: 2)
    @room_price = @room_price.pluck(:price).to_s
    @room_price = @room_price.tr('[]', '')
    @room_price = number_to_currency(@room_price, unit: "VND",  format: "%n %u")

  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations or /reservations.json
  def create
    session[:reservation_params].deep_merge!(params[:reservation_params]) if params[:reservation_params]
    @reservation = Reservation.new(session[:reservation_params])
    @reservation.current_step = session[:reservation_step]
    # puts "Sessions Params in Create"
    # puts session[:reservation_params]
    # puts "Room ID IN CREATE"
    # puts session[:reservation_params]["room_id"]


    # Chưa xét coi có phải multistep không?
    # respond_to do |format|
    #   if @reservation.save
    #     @room = Room.find(reservation_params[:room_id])
    #     if @room.update(status: 2)
    #       format.html { redirect_to @reservation, notice: "Reservation was successfully created." }
    #       format.json { render :show, status: :created, location: @reservation }
    #     else
    #       format.html { render :new, status: :unprocessable_entity }
    #       format.json { render json: @reservation.errors, status: :unprocessable_entity }
    #     end
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @reservation.errors, status: :unprocessable_entity }
    #   end
    # end

    if params[:back_button]
      @reservation.previous_step
    else
      @reservation.next_step
    end
    session[:reservation_step] = @reservation.current_step

    @room_id = session[:reservation_params]["room_id"]
    @room_name = Room.find(@room_id).name
    @room_type_id = Room.find(@room_id).room_type_id
    @room_type_name = RoomType.find(@room_type_id).name
    @payment_type = @@payment_type
    @payment_type_view = convert_nested_hash_to_text(@payment_type)
    @reservation_type = @@reservation_types
    @reservation_type_view = convert_nested_hash_to_text(@reservation_type)

    @payment_type = @@payment_type
    @payment_type_view = convert_nested_hash_to_text(@payment_type)
    @reservation_type = @@reservation_types
    @reservation_type_view = convert_nested_hash_to_text(@reservation_type)

    @room_price = RoomPrice.where(room_type_id: @room_type_id, price_type: 2)
    @room_price = @room_price.pluck(:price).to_s
    @room_price = @room_price.tr('[]', '')
    @room_price = number_to_currency(@room_price, unit: "VND",  format: "%n %u")
    render "new"
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      # params.require(:reservation).permit(:status, :arrivalDate, :leaveDate, :checkInDate, :total)
      params.permit(:arrival_date, :leave_date, :client_name, :client_citizen_id, :children, :adults, :client_id, :employee_id, :room_id, :total, payment_attributes:[:id, :temp_total, :reservation_date, :deposit, :is_paid, :payment_type])

    end
end
