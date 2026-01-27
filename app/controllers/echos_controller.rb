class EchosController < ApplicationController
  before_action :set_echo, only: %i[ show edit update destroy ]

  # GET /echos or /echos.json
  def index
    @echos = Echo.all
  end

  # GET /echos/1 or /echos/1.json
  def show
  end

  # GET /echos/new
  def new
    @echo = Echo.new
  end

  # GET /echos/1/edit
  def edit
  end

  # POST /echos or /echos.json
  def create
    @echo = Echo.new(echo_params)

    respond_to do |format|
      if @echo.save
        format.html { redirect_to @echo, notice: "Echo was successfully created." }
        format.json { render :show, status: :created, location: @echo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @echo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /echos/1 or /echos/1.json
  def update
    respond_to do |format|
      if @echo.update(echo_params)
        format.html { redirect_to @echo, notice: "Echo was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @echo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @echo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /echos/1 or /echos/1.json
  def destroy
    @echo.destroy!

    respond_to do |format|
      format.html { redirect_to echos_path, notice: "Echo was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_echo
      @echo = Echo.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def echo_params
      params.expect(echo: [ :message ])
    end
end
