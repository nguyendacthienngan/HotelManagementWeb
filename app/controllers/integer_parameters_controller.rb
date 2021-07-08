class IntegerParametersController < ApplicationController
  before_action :set_integer_parameter, only: %i[ show edit update destroy ]
  before_action :isAdmin?, only: %i[ new create edit update destroy ]
  # GET /integer_parameters or /integer_parameters.json
  def index
    @integer_parameters = IntegerParameter.all
  end

  # GET /integer_parameters/1 or /integer_parameters/1.json
  def show
  end

  # GET /integer_parameters/new
  def new
    @integer_parameter = IntegerParameter.new
  end

  # GET /integer_parameters/1/edit
  def edit
  end

  # POST /integer_parameters or /integer_parameters.json
  def create
    @integer_parameter = IntegerParameter.new(integer_parameter_params)

    respond_to do |format|
      if @integer_parameter.save
        format.html { redirect_to @integer_parameter, notice: "Integer parameter was successfully created." }
        format.json { render :show, status: :created, location: @integer_parameter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @integer_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /integer_parameters/1 or /integer_parameters/1.json
  def update
    respond_to do |format|
      if @integer_parameter.update(integer_parameter_params)
        format.html { redirect_to @integer_parameter, notice: "Integer parameter was successfully updated." }
        format.json { render :show, status: :ok, location: @integer_parameter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @integer_parameter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /integer_parameters/1 or /integer_parameters/1.json
  def destroy
    @integer_parameter.destroy
    respond_to do |format|
      format.html { redirect_to integer_parameters_url, notice: "Integer parameter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_integer_parameter
      @integer_parameter = IntegerParameter.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def integer_parameter_params
      params.require(:integer_parameter).permit(:param_name, :param_value)
    end
end
