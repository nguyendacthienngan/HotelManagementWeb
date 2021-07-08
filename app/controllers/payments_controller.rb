class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[ show edit update destroy ]

  # GET /payments or /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1 or /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit
    @payment_type = @@payment_type
    @payment_type_view = convert_nested_hash_to_text(@payment_type)

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

  # POST /payments or /payments.json
  def create
    @payment = Payment.new(payment_params)
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

  # PATCH/PUT /payments/1 or /payments/1.json
  def update

    respond_to do |format|
      if @payment.update(payment_params)
        reservations = Reservation.where(payment_id: @payment.id)
        reservations.each do |reservation|
          room_id = reservation.room_id
          room = Room.find(room_id)
          reservation.update(status: 3)
          room.update(status: 1)
        end
        format.html { redirect_to @payment, notice: "Payment was successfully updated." }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: "Payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_params
      params.require(:payment).permit(:reservation_date, :is_paid, :deposit, :temp_total, :check_out_date, :payment_type, :total, :description,
                                      client_attributes:[:id, :name, :citizen_id, :gender, :nationality, :date_of_birth, :email, :client_type, :phone_number ])

    end
end
