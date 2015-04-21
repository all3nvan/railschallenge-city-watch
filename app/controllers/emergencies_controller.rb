class EmergenciesController < ApplicationController
  before_action :render_404, only: [:new, :edit, :destroy]

  def new
  end

  def edit
  end

  def destroy
  end

  def index
    @emergencies = Emergency.all
    render status: :ok, json: { 'emergencies' => @emergencies }
  end

  def create
    @emergency = Emergency.new(emergency_params)
    if @emergency.save
      render status: :created, json: { 'emergency' => @emergency }
    else
      render status: :unprocessable_entity, json: @emergency.error_messages
    end
  end

  def update
    if emergency_params.has_key?(:code)
      render json: { 'message' => 'found unpermitted parameter: code' }
    else
      @emergency = Emergency.find_by(code: params[:id])
      @emergency.update_attributes(emergency_params)
      render json: { 'emergency' => @emergency }
    end
  end

  private

  def emergency_params
    params.require(:emergency)
      .permit(:id, :resolved_at, :code,
              :fire_severity, :police_severity, :medical_severity)
  end
end
