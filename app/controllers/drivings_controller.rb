class DrivingsController < ApplicationController
  before_action :set_driving, only: %i[ show edit update destroy ]

  # GET /drivings or /drivings.json
  def index
    @drivings = Driving.all
  end

  # GET /drivings/1 or /drivings/1.json
  def show
  end

  # GET /drivings/new
  def new
    @driving = Driving.new
    if params[:is_vehicle]
      @vehicle = Vehicle.find(params[:id])
    elsif params[:is_driver]
      @driver = Driver.find(params[:id])
    end
  end

  def unlink
    if params[:is_vehicle]
      @driving = Driving.where(vehicle_id: params[:id]).last
    elsif params[:is_driver]
      @driving = Driving.where(driver_id: params[:id]).last
    end
    @driving.update(data_final: Time.now)
    @driving.driver.update(situacao: "INATIVO")
    @driving.vehicle.update(situacao: "INATIVO")

    if params[:is_vehicle]
      flash[:notice] = "Pedido Atualizado com Sucesso"
      @pagy, @vehicles = pagy(Vehicle.all, limit: 10)
      @drivings = Driving.all
      render controller: 'vehicles', action: 'index'
    elsif params[:is_driver]
      flash[:notice] = "Pedido Atualizado com Sucesso"
      @pagy, @drivers = pagy(Driver.all, limit: 10)
      @drivings = Driving.all
      render controller: 'drivers', action: 'index'
    end
  end

  # GET /drivings/1/edit
  def edit
  end

  # POST /drivings or /drivings.json
  def create
    @driving = Driving.new(driving_params)
    @driving.data_inicial = Time.now

    respond_to do |format|
      if @driving.save
        @driving.driver.update(situacao: "ATIVO")
        @driving.vehicle.update(situacao: "ATIVO")
        format.html { redirect_to driving_url(@driving), notice: "Driving was successfully created." }
        format.json { render :show, status: :created, location: @driving }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @driving.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drivings/1 or /drivings/1.json
  def update
    respond_to do |format|
      if @driving.update(driving_params)
        @driving.update(data_final: Time.now)
        @driving.driver.update(situacao: "INATIVO")
        @driving.vehicle.update(situacao: "INATIVO")
        format.html { redirect_to driving_url(@driving), notice: "Driving was successfully updated." }
        format.json { render :show, status: :ok, location: @driving }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @driving.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drivings/1 or /drivings/1.json
  def destroy
    @driving.destroy!

    respond_to do |format|
      format.html { redirect_to drivings_url, notice: "Driving was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driving
      @driving = Driving.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def driving_params
      params.require(:driving).permit(:driver_id, :vehicle_id)
    end
end
