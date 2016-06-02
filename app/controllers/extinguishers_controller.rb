class ExtinguishersController < ApplicationController
  before_action :set_extinguisher, only: [:show, :edit, :update, :destroy, :renew]

  # GET /extinguishers
  # GET /extinguishers.json
  def index
    @extinguishers = Extinguisher.from_sector(params[:sector_id]).order(:expiration_at).includes(:sector)
    @sectors = Sector.all
  end

  # GET /extinguishers/1
  # GET /extinguishers/1.json
  def show
    index
    render :index
  end

  # GET /extinguishers/new
  def new
    @extinguisher = Extinguisher.new
  end

  # GET /extinguishers/1/edit
  def edit
  end

  # POST /extinguishers
  # POST /extinguishers.json
  def create
    @extinguisher = Extinguisher.new(extinguisher_params)

    respond_to do |format|
      if @extinguisher.save
        format.html { redirect_to @extinguisher, notice: 'Extinguisher was successfully created.' }
        format.json { render :show, status: :created, location: @extinguisher }
      else
        format.html { render :new }
        format.json { render json: @extinguisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extinguishers/1
  # PATCH/PUT /extinguishers/1.json
  def update
    respond_to do |format|
      if @extinguisher.update(extinguisher_params)
        format.html { redirect_to @extinguisher, notice: 'Extinguisher was successfully updated.' }
        format.json { render :show, status: :ok, location: @extinguisher }
      else
        format.html { render :edit }
        format.json { render json: @extinguisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extinguishers/1
  # DELETE /extinguishers/1.json
  def destroy
    @extinguisher.destroy
    respond_to do |format|
      format.html { redirect_to extinguishers_url, notice: 'Extinguisher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def renew
    @extinguisher.renew
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extinguisher
      @extinguisher = Extinguisher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def extinguisher_params
      params.require(:extinguisher).permit(:kind, :expiration_at, :sector_id)
    end
end
