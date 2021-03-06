class SectorsController < ApplicationController
  before_action :set_sector, only: [:show, :edit, :update, :destroy]

  def index
    @sectors = Sector.all
  end

  def show
  end

  def new
    @sector = Sector.new
  end

  def edit
  end

  def create
    @sector = Sector.new sector_params
    @sector.save!
    redirect_to @sector, notice: 'Sector was successfully created.'
  end

  def update
    @sector.update! sector_params
    redirect_to @sector, notice: 'Sector was successfully updated.'
  end

  def destroy
    @sector.destroy
    redirect_to sectors_url, notice: 'Sector was successfully destroyed.'
  end

  private

    def set_sector
      @sector = Sector.find params[:id]
    end

    def sector_params
      params.require(:sector).permit(:name, :latitude, :longitude)
    end
end
