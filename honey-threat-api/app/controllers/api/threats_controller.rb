class Api::ThreatsController < ApplicationController

  before_action :set_threat, only: [:show, :edit, :update]

  def index
    render json: Threat.all
  end

  def create
    threat = Threat.new(threat_params)
    if threat.save
      render json:threat
    else
      render json: { message: threat.errors }, status: 400
    end
  end

  def show
    render json: @threat
  end

  def update
    if @threat.update(threat_params)
      render json: @threat
    else
      render json: { message: threat.errors }, status: 400
    end
  end

  private

  def set_threat
    @threat = Threat.find_by(id: params[:id])
  end

  def threat_params
    params.require(:threat).permit(:ip, :count, :lat, :long, :country)
  end

end