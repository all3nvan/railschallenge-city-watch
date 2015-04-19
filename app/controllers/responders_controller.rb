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
            render status: :created, json: { 'responder' => @responder }
        else
            render status: :unprocessable_entity, json: @responder.get_error_messages
        end
    end
    
    private
    
        def responder_params
            params.require(:responder)
                  .permit(:id, :emergency_code, :type, :name, :capacity, :on_duty)
        end
    
end
