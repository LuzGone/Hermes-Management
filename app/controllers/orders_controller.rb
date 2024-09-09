class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @pagy, @orders = pagy(Order.all, limit: 10)
    @suppliers = Supplier.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @suppliers = Supplier.all
  end

  # GET /orders/1/edit
  def edit
    @suppliers = Supplier.all
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        flash.now[:notice] = "Pedido Criado com Sucesso"
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("toast", partial:"layouts/toast"),
            turbo_stream.update("modal", partial: "layouts/empty")
          ]
        end
        format.html { redirect_to orders_path}
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        flash.now[:notice] = "Pedido Atualizado com Sucesso"
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("toast", partial:"layouts/toast"),
            turbo_stream.update("modal", partial: "layouts/empty")
          ]
        end
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy!

    respond_to do |format|
      flash.now[:notice] = "Pedido Deletado com Sucesso"
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update("toast", partial:"layouts/toast")
        ]
      end
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:danfe, :nfe, :endereco_entrega, :status_pedido, :supplier_id)
    end
end
