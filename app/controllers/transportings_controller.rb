class TransportingsController < ApplicationController
  before_action :set_transporting, only: %i[ show edit update destroy ]

  # GET /transportings or /transportings.json
  def index
    @transportings = Transporting.all
  end

  # GET /transportings/1 or /transportings/1.json
  def show
  end

  # GET /transportings/new
  def new
    @transporting = Transporting.new
  end

  # GET /transportings/1/edit
  def edit
  end

  # POST /transportings or /transportings.json
  def create
    @transporting = Transporting.new(transporting_params)

    respond_to do |format|
      if @transporting.save
        format.html { redirect_to transporting_url(@transporting), notice: "Transporting was successfully created." }
        format.json { render :show, status: :created, location: @transporting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transporting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transportings/1 or /transportings/1.json
  def update
    respond_to do |format|
      if @transporting.update(transporting_params)
        format.html { redirect_to transporting_url(@transporting), notice: "Transporting was successfully updated." }
        format.json { render :show, status: :ok, location: @transporting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transporting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transportings/1 or /transportings/1.json
  def destroy
    @transporting.destroy!

    respond_to do |format|
      format.html { redirect_to transportings_url, notice: "Transporting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transporting
      @transporting = Transporting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transporting_params
      params.require(:transporting).permit(:origem, :destino, :order_id, :vehicle_id, :dataDespache, :dataEntrega)
    end
end
