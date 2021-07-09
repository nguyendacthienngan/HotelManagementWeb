class RoomTypesController < ApplicationController
  before_action :set_room_type, only: %i[ show edit update destroy ]
  before_action :isAdmin?, only: %i[ new create edit update destroy ]
  add_breadcrumb "Trang chủ", :root_path
  add_breadcrumb "Loại phòng", :room_types_path

  # GET /room_types or /room_types.json
  def index
    @room_types = RoomType.all
  end

  # GET /room_types/1 or /room_types/1.json
  def show
    add_breadcrumb "Xem"
  end

  # GET /room_types/new
  def new
    add_breadcrumb "Thêm"
    @room_type = RoomType.new
  end

  # GET /room_types/1/edit
  def edit
    add_breadcrumb "Sửa"
  end

  # POST /room_types or /room_types.json
  def create
    @room_type = RoomType.new(room_type_params)

    respond_to do |format|
      if @room_type.save
        format.html { redirect_to @room_type, notice: "Room type was successfully created." }
        format.json { render :show, status: :created, location: @room_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_types/1 or /room_types/1.json
  def update
    respond_to do |format|
      if @room_type.update(room_type_params)
        format.html { redirect_to @room_type, notice: "Room type was successfully updated." }
        format.json { render :show, status: :ok, location: @room_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_types/1 or /room_types/1.json
  def destroy
    rooms = Room.where(room_type_id: @room_type.id)
    reserved_room = []
    rooms.each do |r|
      reserved_room = Reservation.where(room_id: r.id)
      if reserved_room
        break
      end
    end
    room_type_name = @room_type.name
    respond_to do |format|
      if !reserved_room.empty?
        format.html { redirect_to room_types_url, :flash => { :error =>   "Loại phòng #{room_type_name} đang có các phòng được sử dụng" }}
        format.json { head :no_content }
      else
        @room_type.destroy
        format.html { redirect_to room_types_url, notice: "Loại phòng #{room_type_name} đã được xóa" }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_type
      @room_type = RoomType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_type_params
      params.require(:room_type).permit(:name, :hour_price, :date_price, :past_night_price, :week_price, :month_price, :add_adult_price, :add_child_price, :description, :beds, :available_rooms)
    end
end
