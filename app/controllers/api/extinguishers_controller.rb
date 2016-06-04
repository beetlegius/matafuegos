module Api
  class ExtinguishersController < ApiController
    before_action :get_extinguisher, only: [:show, :update, :destroy, :renew]

    def index
      extinguishers = Extinguisher.includes(:sector).from_sector(params[:sector_id]).order(:expiration_at)
      render json: extinguishers, status: 200
    end

    def show
      render_extinguisher
    end

    def create
      @extinguisher = Extinguisher.create! extinguisher_params
      render_extinguisher(201)
    end

    def update
      @extinguisher.update! extinguisher_params
      render_extinguisher
    end

    def destroy
      @extinguisher.destroy
      head 204
    end

    def renew
      @extinguisher.renew
      render_extinguisher
    end

    protected

    def render_extinguisher(status = 200)
      render json: @extinguisher, status: status
    end

    def extinguisher_params
      params.require(:extinguisher).permit(:kind, :expiration_at, :sector_id)
    end

    def get_extinguisher
      @extinguisher = Extinguisher.find params[:id]
    end

  end
end
