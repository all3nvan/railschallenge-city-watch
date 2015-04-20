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
    @responder = Responder.find_by(name: params[:id])
    @responder.update_attributes(responder_params)
  end

  private

  def responder_params
    params.require(:responder)
      .permit(:id, :emergency_code, :type, :name, :capacity, :on_duty)
  end
end
