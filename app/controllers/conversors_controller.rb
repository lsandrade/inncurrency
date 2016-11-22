class ConversorsController < ApplicationController
  before_action :set_conversor, only: [:show, :edit, :update, :destroy]

  # GET /conversors
  # GET /conversors.json
  def index
    @conversors = Conversor.all
  end

  # GET /conversors/1
  # GET /conversors/1.json
  def show
  end

  # GET /conversors/new
  def new
    @conversor = Conversor.new
  end

  # GET /conversors/1/edit
  def edit
  end

  # POST /conversors
  # POST /conversors.json
  def create
    @conversor = Conversor.new(conversor_params)

    respond_to do |format|
      if @conversor.save
        format.html { redirect_to @conversor, notice: 'Conversor was successfully created.' }
        format.json { render :show, status: :created, location: @conversor }
      else
        format.html { render :new }
        format.json { render json: @conversor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conversors/1
  # PATCH/PUT /conversors/1.json
  def update
    respond_to do |format|
      if @conversor.update(conversor_params)
        format.html { redirect_to @conversor, notice: 'Conversor was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversor }
      else
        format.html { render :edit }
        format.json { render json: @conversor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversors/1
  # DELETE /conversors/1.json
  def destroy
    @conversor.destroy
    respond_to do |format|
      format.html { redirect_to conversors_url, notice: 'Conversor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversor
      @conversor = Conversor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversor_params
      params.fetch(:conversor, {})
    end
end
