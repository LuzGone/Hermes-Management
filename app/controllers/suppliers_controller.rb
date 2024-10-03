class SuppliersController < ApplicationController
  before_action :set_supplier, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:index, :show, :new, :edit, :update, :destroy, :create]

  # GET /suppliers or /suppliers.json
  def index
    @q = Supplier.ransack(params[:q])
    @pagy, @suppliers = pagy(@q.result(distinct: true), limit: 10)
  end

  # GET /suppliers/1 or /suppliers/1.json
  def show
  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers or /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        flash.now[:notice] = "Fornecedor Criado com Sucesso"
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("toast", partial:"layouts/toast"),
            turbo_stream.update("modal", partial: "layouts/empty")
          ]
        end
        format.html { redirect_to supplier_url(@supplier), notice: "Supplier was successfully created." }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suppliers/1 or /suppliers/1.json
  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        flash.now[:notice] = "Fornecedor Editado com Sucesso"
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("toast", partial:"layouts/toast"),
            turbo_stream.update("modal", partial: "layouts/empty")
          ]
        end
        format.html { redirect_to supplier_url(@supplier), notice: "Supplier was successfully updated." }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1 or /suppliers/1.json
  def destroy
    @supplier.destroy!

    respond_to do |format|
      flash.now[:notice] = "Fornecedor Excluído com Sucesso"
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("toast", partial:"layouts/toast")
          ]
        end
      format.html { redirect_to suppliers_url, notice: "Supplier was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def supplier_params
      params.require(:supplier).permit(:nome)
    end
end
