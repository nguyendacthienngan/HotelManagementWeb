class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]
  add_breadcrumb "Trang chủ", :root_path
  add_breadcrumb "Khách hàng", :clients_path

  # GET /clients or /clients.json
  def index
    @clients = Client.all
    # @types = @@client_types
    @client_type =  @@client_types
    @client_gender = @@gender
  end

  # GET /clients/1 or /clients/1.json
  def show
    add_breadcrumb "Xem"
    @client_type =  @@client_types
    @client_gender = @@gender
  end

  # GET /clients/new
  def new
    add_breadcrumb "Thêm"
    @client = Client.new
    @client_type = @@client_types
    @client_type_view = convert_nested_hash_to_text(@client_type)
    @client_gender = @@gender
    @client_gender_view = convert_nested_hash_to_text(@client_gender)
  end

  # GET /clients/1/edit
  def edit
    add_breadcrumb "Sửa"
    @client_type = @@client_types
    @client_type_view = convert_nested_hash_to_text(@client_type)
    @client_gender = @@gender
    @client_gender_view = convert_nested_hash_to_text(@client_gender)
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: "Client was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    payments = Payment.where(client_id: @client.id)
    respond_to do |format|
      if !payments.empty?
        format.html { redirect_to clients_url, :flash => { :error =>  "Khách hàng #{@client.name} đang sử dụng, không thể xóa" }}
        format.json { head :no_content }
      else
        if @client.id != 1
          @client.destroy
          format.html { redirect_to clients_url, notice: "Khách hàng #{@client.name} đã được xóa" }
          format.json { head :no_content }
        else
          format.html { redirect_to clients_url, :flash => { :error =>  "Khách lữ hành không thể được xóa" }}
          format.json { head :no_content }
        end

      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :citizen_id, :gender, :nationality, :date_of_birth, :email, :client_type, :phone_number)
    end
end
