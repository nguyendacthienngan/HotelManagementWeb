class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]
  add_breadcrumb "Trang chủ", :root_path
  add_breadcrumb "Khách lẻ", :reservations_path

  # GET /reservations or /reservations.json
  def index
    @reservations = Reservation.all
    @reservation_statuses = @@reservation_statuses

  end

  # GET /reservations/1 or /reservations/1.json
  def show
    add_breadcrumb "Chi tiết đặt phòng"

    @reservation_statuses = @@reservation_statuses

  end

  # GET /reservations/new
  def new
    add_breadcrumb "Tạo đơn đặt phòng"

    # reset_session
    session[:reservation_params] = nil
    session[:reservation_params] ||= {}

    @reservation = Reservation.new(session[:reservation_params])
    @room_id = (params[:room_id])? params[:room_id] : 1
    if session[:reservation_params] == nil
      session[:reservation_params][:room_id] = @room_id
      # session[:reservation_params].deep_merge!(params[:room_id])
    end
    @reservation.current_step
    session[:multi_step] = @reservation.multi_step


    @room_name = Room.find(@room_id).name
    @rooms = Room.all
    @room_type_id = Room.find(@room_id).room_type_id
    @room_type_name = RoomType.find(@room_type_id).name
    @payment_type = @@payment_type
    @payment_type_view = convert_nested_hash_to_text(@payment_type) 
    @reservation_type = @@reservation_types
    @reservation_type_view = convert_nested_hash_to_text(@reservation_type)

    @gender = @@gender
    @gender = convert_nested_hash_to_text(@gender)

    @price_type = params[:price_type_id] || 2
    @adults_price = RoomPrice.where(room_type_id: @room_type_id, price_type: 6).pluck(:price).to_s
    @adults_price = currency_name(@adults_price)
    @adults_price = currency_value(@adults_price)

    @children_price = RoomPrice.where(room_type_id: @room_type_id, price_type: 7).pluck(:price).to_s
    @children_price = currency_name(@children_price)
    @children_price = currency_value(@children_price)

    @room_price_name = RoomPrice.where(room_type_id: @room_type_id, price_type: @price_type).pluck(:price).to_s
    @room_price_name = currency_name(@room_price_name)
    @room_price_value = currency_value(@room_price_name)
  end

  # GET /reservations/1/edit
  def edit
    add_breadcrumb "Chỉnh sửa đặt phòng"

    @reservation_statuses = @@reservation_statuses
    @reservation_statuses_view = convert_nested_hash_to_text(@reservation_statuses)

    @room_statuses = @@room_statuses
    @room_statuses_view = convert_nested_hash_to_text(@room_statuses)
  end

  # POST /reservations or /reservations.json
  def create
    session[:reservation_params].deep_merge!(reservation_params) if reservation_params
    puts "Reservation param session"
    puts session[:reservation_params]
    @reservation = Reservation.new(session[:reservation_params])

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
    if (session[:multi_step] == false)
      # Đặt phòng nhanh
      respond_to do |format|
        room_id = reservation_params[:room_id]
        @room = Room.find(room_id)
        room_type_id_new = RoomType.find(@room.room_type_id)
        if @reservation.save
          if @room.update(status: 4)
            format.html { redirect_to @reservation, notice: "Reservation was successfully created." }
            format.json { render :show, status: :created, location: @reservation }
          else
            format.html { render "room_diagram/quick_reserve_room", locals: { room_id: room_id, room_type_id: room_type_id_new}, status: :unprocessable_entity}
            format.json { render json: @reservation.errors, status: :unprocessable_entity }
          end
        else
          # format.js { redirect_to "room_diagram/quick_reserve_room", locals: { room_id: room_id}, format: 'js', status: :unprocessable_entity}
          format.html { render "room_diagram/quick_reserve_room", locals: { room_id: room_id, room_type_id: room_type_id_new}, status: :unprocessable_entity}
          format.json { render json: @reservation.errors, status: :unprocessable_entity }
        end
      end
    else
      if session[:reservation_params]["reservation_type"] == 2
        # Khách đoàn

      else
        # Khách lẻ
        @reservation.current_step = session[:reservation_step]

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

        @price_type = params[:price_type_id] || 2
        @adults_price = RoomPrice.where(room_type_id: @room_type_id, price_type: 6).pluck(:price).to_s
        @adults_price = currency_name(@adults_price)
        @adults_price = currency_value(@adults_price)

        @children_price = RoomPrice.where(room_type_id: @room_type_id, price_type: 7).pluck(:price).to_s
        @children_price = currency_name(@children_price)
        @children_price = currency_value(@children_price)

        @room_price_name = RoomPrice.where(room_type_id: @room_type_id, price_type: @price_type).pluck(:price).to_s
        @room_price_name = currency_name(@room_price_name)
        @room_price_value = currency_value(@room_price_name)

        @gender = @@gender
        @gender = convert_nested_hash_to_text(@gender)

        if @reservation.valid?
          room_id = reservation_params[:room_id]
          if @reservation.all_valid?
            if @reservation.save
              @room = Room.find(room_id)
              if @room.update(status: 2)
              end
            end
          end
        end
        if @reservation.new_record?
          render "new"
        else
          session[:reservation_step] = session[:reservation_params] = nil
          flash[:notice] = "Order saved"
          redirect_to @reservation
        end
      end



    end
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

  def change_status
    respond_to do |format|
      @reservation = Reservation.find(params[:id])
      room_id = @reservation.room_id
      room = Room.find(room_id)
      if room.update(:status => params[:status]) && @reservation.update(:status => params[:status])
        format.html { redirect_to @reservation, notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
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
