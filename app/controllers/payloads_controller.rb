class PayloadsController < ApplicationController
  before_action :set_payload, only: %i[ show edit update destroy ]

  # GET /payloads or /payloads.json
  def index
    @payloads = Payload.all
  end

  # GET /payloads/1 or /payloads/1.json
  def show
  end

  # GET /payloads/new
  def new
    @payload = Payload.new
  end

  # GET /payloads/1/edit
  def edit
  end

  # POST /payloads or /payloads.json
  def create
    @payload = Payload.new(payload_params)

    respond_to do |format|
      if @payload.save
        format.html { redirect_to payload_url(@payload), notice: "Payload was successfully created." }
        format.json { render :show, status: :created, location: @payload }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payloads/1 or /payloads/1.json
  def update
    respond_to do |format|
      if @payload.update(payload_params)
        format.html { redirect_to payload_url(@payload), notice: "Payload was successfully updated." }
        format.json { render :show, status: :ok, location: @payload }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payloads/1 or /payloads/1.json
  def destroy
    @payload.destroy!

    respond_to do |format|
      format.html { redirect_to payloads_url, notice: "Payload was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payload
      @payload = Payload.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payload_params
      params.fetch(:payload, {})
    end
end
