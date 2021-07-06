class RoomPricesController < ApplicationController
  before_action :set_room_price, only: %i[ show edit update destroy ]

  # GET /room_prices or /room_prices.json
  def index
    @room_prices = RoomPrice.all
    @a = @@price_types;
  end

  # GET /room_prices/1 or /room_prices/1.json
  def show
  end

  # GET /room_prices/new
  def new
    @room_price = RoomPrice.new
  end

  # GET /room_prices/1/edit
  def edit
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
    @room_price.destroy
    respond_to do |format|
      format.html { redirect_to room_prices_url, notice: "Room price was successfully destroyed." }
      format.json { head :no_content }
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
