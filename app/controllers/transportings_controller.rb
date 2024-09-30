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
    @order = Order.find(params[:id])
    @last_transporting = Transporting.where(order_id: @order.id).last
  end

  # GET /transportings/1/edit
  def edit
  end

  # POST /transportings or /transportings.json
  def create
    @transporting = Transporting.new(transporting_params)
    @transporting.data_despache = Time.now
    @last_transporting = Transporting.where(order_id: @transporting.order.id).last
    
    respond_to do |format|
      if @transporting.save
        if @last_transporting 
          @last_transporting.update(data_entrega: Time.now)
        else
          @transporting.order.update(status_pedido: "A CAMINHO")
        end
        atualizar_redis(@transporting)
        flash.now[:notice] = "Pedido Atribuído com Sucesso"
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("toast", partial:"layouts/toast"),
            turbo_stream.update("modal", partial: "layouts/empty")
          ]
        end
        format.html { redirect_to transporting_url(@transporting), notice: "Transporting was successfully created." }
        format.json { render :show, status: :created, location: @transporting }
      else
        format.html { render :new, status: :unprocessable_entity}
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

    def atualizar_redis(transporting)
      order = transporting.order
      transportings = Transporting.where(order_id: order.id)
      pedido = {pedido:order,historico:transportings}
      REDIS.set("order:#{order.codigo_rastreio}", pedido.to_json)
    end

    # Only allow a list of trusted parameters through.
    def transporting_params
      params.require(:transporting).permit(:origem, :destino, :order_id, :vehicle_id, :dataDespache, :dataEntrega)
    end
end
