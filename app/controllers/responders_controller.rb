class RespondersController < ApplicationController
  before_action :render_404, only: [:new, :edit, :destroy]

  def new
  end

  def edit
  end

  def destroy
  end

  def create
    @responder = Responder.new(responder_params)
    if @responder.save
      render status: :created,
             json: { 'responder' => @responder.as_json(only: [:emergency_code,
                                                              :type,
                                                              :name,
                                                              :capacity,
                                                              :on_duty]) }
    else
      render status: :unprocessable_entity, json: @responder.error_messages
    end
  end

  def update
    if [:emergency_code, :type, :name, :capacity].any? { |attribute| responder_params.key?(attribute) }
      render status: 422,
             json: { 'message' => "found unpermitted parameter: #{responder_params.keys.first}" }
    else
      @responder = Responder.find_by(name: params[:id])
      @responder.update_attributes(responder_params)
      render json: { 'responder' => @responder }
    end
  end

  def show
    @responder = Responder.find_by(name: params[:id])
    render json: { 'responder' => @responder }
  end

  private

  def responder_params
    params.require(:responder)
      .permit(:id, :emergency_code, :type, :name, :capacity, :on_duty)
  end
end
