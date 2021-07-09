class RoomPricesController < ApplicationController
  before_action :set_room_price, only: %i[ show edit update destroy ]
  before_action :isAdmin?, only: %i[ new create edit update destroy ]
  add_breadcrumb "Trang chủ", :root_path
  add_breadcrumb "Giá phòng", :room_prices_path

  # GET /room_prices or /room_prices.json
  def index
    @room_prices = RoomPrice.all
    @price_types = @@price_types
    @room_type =  @@room_types
  end

  # GET /room_prices/1 or /room_prices/1.json
  def show
    add_breadcrumb "Xem"
    @room_type =  @@room_types
    @price_types = @@price_types
  end

  # GET /room_prices/new
  def new
    add_breadcrumb "Thêm"
    @room_price = RoomPrice.new
    @room_type =  @@room_types
    @room_type_view = convert_nested_hash_to_text(@room_type)
    @price_types = @@price_types
    @price_type_view = convert_nested_hash_to_text(@price_types)
  end

  # GET /room_prices/1/edit
  def edit
    add_breadcrumb "Sửa"
    @room_type =  @@room_types
    @room_type_view = convert_nested_hash_to_text(@room_type)
    @price_types = @@price_types
    @price_type_view = convert_nested_hash_to_text(@price_types)
  end

  # POST /room_prices or /room_prices.json
  def create
    @room_price = RoomPrice.new(room_price_params)

    respond_to do |format|
      if @room_price.save
        format.html { redirect_to @room_price, notice: "Room price was successfully created." }
        format.json { render :show, status: :created, location: @room_price }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_prices/1 or /room_prices/1.json
  def update
    respond_to do |format|
      if @room_price.update(room_price_params)
        format.html { redirect_to @room_price, notice: "Room price was successfully updated." }
        format.json { render :show, status: :ok, location: @room_price }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_prices/1 or /room_prices/1.json
  def destroy
    rooms = Room.where(room_type_id: @room_price.room_type_id)
    reserved_room = []
    rooms.each do |r|
      reserved_room = Reservation.where(room_id: r.id)
      if reserved_room
        break
      end
    end
    respond_to do |format|
      if !reserved_room.empty?
        format.html { redirect_to room_prices_url, :flash => { :error =>  "Không thể xóa giá phòng này vì phòng có giá phòng này đang được sử dụng" }}
        format.json { head :no_content }
      else
        @room_price.destroy
        format.html { redirect_to room_prices_url, notice: "Giá phòng đã được xóa" }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_price
      @room_price = RoomPrice.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_price_params
      params.require(:room_price).permit(:price, :price_type, :begin_date, :end_date, :is_available, :room_type_id, :date)
    end
end
