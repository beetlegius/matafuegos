class ExtinguishersController < ApplicationController
  before_action :set_extinguisher, only: [:show, :edit, :update, :destroy, :renew]

  def index
    @extinguishers = Extinguisher.from_sector(params[:sector_id]).order(:expiration_at).includes(:sector)
    @sectors = Sector.all
  end

  def show
    index
    render :index
  end

  def new
    @extinguisher = Extinguisher.new
  end

  def edit
  end

  def create
    @extinguisher = Extinguisher.new extinguisher_params
    @extinguisher.save!
    redirect_to @extinguisher, notice: 'Extinguisher was successfully created.'
  end

  def update
    @extinguisher.update! extinguisher_params
    redirect_to @extinguisher, notice: 'Extinguisher was successfully updated.'
  end

  def destroy
    @extinguisher.destroy
    redirect_to extinguishers_url, notice: 'Extinguisher was successfully destroyed.'
  end

  def renew
    @extinguisher.renew
  end

  private

    def set_extinguisher
      @extinguisher = Extinguisher.find params[:id]
    end

    def extinguisher_params
      params.require(:extinguisher).permit(:kind, :expiration_at, :sector_id)
    end
end
