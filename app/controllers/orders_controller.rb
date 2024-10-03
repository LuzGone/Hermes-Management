class OrdersController < ApplicationController
  require "csv"
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:index, :show, :new, :edit, :update, :destroy, :create]
  # GET /orders or /orders.json
  def index
    @q = Order.ransack(params[:q])
    @pagy, @orders = pagy(@q.result.includes(:supplier), limit: 10)
    @suppliers = Supplier.all
  end

  # GET /orders/1 or /orders/1.json
  def show
    @transportings = Transporting.where(order_id: @order.id)
  end

  def show_by_codigo_rastreio
    codigo_rastreio = params[:codigo_rastreio]
    @order = REDIS.get("order:#{codigo_rastreio}")
    unless @order
      @order = Order.find_by(codigo_rastreio: codigo_rastreio)
      if @order
        @transportings = Transporting.where(order_id: @order.id)
        @pedido = {pedido:@order,historico:@transportings}
        REDIS.set("order:#{codigo_rastreio}", @pedido.to_json)
        render json: @pedido
        return 
      else
        head :not_found
        return 
      end
    end
    render json: @order
    return 
  end

  # GET /orders/new
  def new
    @order = Order.new
    @suppliers = Supplier.all
  end

  def csv_form
  end

  def import
    file = params[:file]
    if !file
      return redirect_to orders_path
    end
    puts(file.content_type)
    if file.content_type != "text/csv"
      return redirect_to orders_path
    end

    file = File.open(file)
    csv = CSV.parse(file, headers: true, col_sep:";")
    csv.each do |row|
      order_hash = {}
      order_hash[:danfe] = row["DANFE"]
      order_hash[:nfe] = row["NFE"]
      order_hash[:codigo_rastreio] = row["Codigo de Rastreio"]
      order_hash[:endereco_entrega] = row["Endereco"]
      order_hash[:email] = row["Email"]
      order_hash[:status_pedido] = "PENDENTE"
      order_hash[:supplier_id] = Supplier.all.sample.id
      order_hash[:data_fornecimento] = Time.now.in_time_zone('America/Sao_Paulo')
      Order.create(order_hash)
    end
    redirect_to orders_path
  end

  def mark_as_delivered
    @order = Order.find(params[:id])
    @last_transporting = Transporting.where(order_id: @order.id).last
    @last_transporting.update(data_entrega: Time.now.in_time_zone('America/Sao_Paulo'))
    if @last_transporting.destino === @order.endereco_entrega
      @order.update(status_pedido: "ENTREGUE")
    else
      @order.update(status_pedido: "EM ESPERA")
    end
    atualizar_redis(@order)
    if user_signed_in?
      redirect_to orders_path
    end
    if driver_signed_in?
      redirect_to orders_drivers_path
    end
  end

  # GET /orders/1/edit
  def edit
    @suppliers = Supplier.all
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    @order.data_fornecimento = Time.now.in_time_zone('America/Sao_Paulo')

    respond_to do |format|
      if @order.save
        atualizar_redis(@order)
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
        atualizar_redis(@order)
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

    def atualizar_redis(order)
      transportings = Transporting.where(order_id: order.id)
      pedido = {pedido:order,historico:transportings}
      REDIS.set("order:#{order.codigo_rastreio}", pedido.to_json)
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:danfe, :nfe, :codigo_rastreio, :endereco_entrega, :status_pedido, :supplier_id,:data_fornecimento,:email)
    end
end
