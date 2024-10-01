class DriversController < ApplicationController
  before_action :set_driver, only: %i[ show edit update destroy ]

  # GET /drivers or /drivers.json
  def index
    @pagy, @drivers = pagy(Driver.order(created_at: :asc), limit: 10)
  end

  # GET /drivers/1 or /drivers/1.json
  def show
    @drivings = Driving.where(driver_id: @driver.id)
  end

  # GET /drivers/new
  def new
    @driver = Driver.new
  end

  # GET /drivers/1/edit
  def edit
  end

  # POST /drivers or /drivers.json
  def create
    @driver = Driver.new(driver_params)

    respond_to do |format|
      if @driver.save
        flash.now[:notice] = "Motorista Criado com Sucesso"
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("toast", partial:"layouts/toast"),
            turbo_stream.update("modal", partial: "layouts/empty")
          ]
        end
        format.html { redirect_to driver_url(@driver), notice: "Driver was successfully created." }
        format.json { render :show, status: :created, location: @driver }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drivers/1 or /drivers/1.json
  def update
    respond_to do |format|
      if @driver.update(driver_params)
        flash.now[:notice] = "Motorista Editado com Sucesso"
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("toast", partial:"layouts/toast"),
            turbo_stream.update("modal", partial: "layouts/empty")
          ]
        end
        format.html { redirect_to driver_url(@driver), notice: "Driver was successfully updated." }
        format.json { render :show, status: :ok, location: @driver }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drivers/1 or /drivers/1.json
  def destroy
    @driver.destroy!

    respond_to do |format|
      flash.now[:notice] = "Motorista Deletado com Sucesso"
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("toast", partial:"layouts/toast"),
          ]
        end
      format.html { redirect_to drivers_url, notice: "Driver was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  #Paginas do Motorista
  # GET /driver/1/orders
  def orders
  end

  # GET /driver/1/orders_history
  def orders_history
  end

  # GET /driver/1/vehicles_history
  def vehicles_history
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      @driver = Driver.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def driver_params
      params.require(:driver).permit(:nome, :matricula, :endereco, :telefone, :login, :senha)
    end
end
