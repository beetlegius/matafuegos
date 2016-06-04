module Api
  class SectorsController < ApiController
    before_action :get_sector, only: [:show, :update, :destroy]

    def index
      sectors = Sector.all
      render json: sectors, status: 200
    end

    def show
      render_sector
    end

    def create
      @sector = Sector.create! sector_params
      render_sector(201)
    end

    def update
      @sector.update! sector_params
      render_sector
    end

    def destroy
      @sector.destroy
      head 204
    end

    protected

    def render_sector(status = 200)
      render json: @sector, status: status
    end

    def sector_params
      params.require(:sector).permit(:name, :latitude, :longitude)
    end

    def get_sector
      @sector = Sector.find params[:id]
    end

  end
end
