class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]

  # GET /rooms or /rooms.json
  def index
    @rooms = Room.all
    # @status = @@room_statuses tang,loai phong, trang thai
    @floor = @@floor
    @room_type =  @@room_types 
    @room_statuses = @@room_statuses

  end

  # GET /rooms/1 or /rooms/1.json
  def show
    @room_type =  @@room_types
    @floor = @@floor
    @room_statuses = @@room_statuses
  end

  # GET /rooms/new
  def new
    @room = Room.new
    @room_type =  @@room_types
    @room_type_view = convert_nested_hash_to_text(@room_type)
    @floor = @@floor
    @floor_view = convert_nested_hash_to_text(@floor)
    @room_statuses = @@room_statuses
    @room_statuses_view = convert_nested_hash_to_text(@room_statuses)
  end

  # GET /rooms/1/edit
  def edit
    @room_type =  @@room_types
    @room_type_view = convert_nested_hash_to_text(@room_type)
    @floor = @@floor
    @floor_view = convert_nested_hash_to_text(@floor)
    @room_statuses = @@room_statuses
    @room_statuses_view = convert_nested_hash_to_text(@room_statuses)
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name, :beds, :status, :floor, :capacity, :price, :room_type_id, :description)
    end
end
