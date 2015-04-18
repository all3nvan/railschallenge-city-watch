class EmergenciesController < ApplicationController
    
    require 'json'
    
    def new
        render_404
    end
    
    def edit
        render_404
    end
    
    def destroy
        render_404
    end
    
    def create
        @emergency = Emergency.new(emergency_params)
        if @emergency.save
            render status: :created, json: { 'emergency' => @emergency }
        else
            render status: :unprocessable_entity, json: @emergency.get_error_messages
        end
    end
    
    private
        
        def emergency_params
           params.require(:emergency)
                 .permit(:id, :resolved_at, :code,
                         :fire_severity, :police_severity, :medical_severity)
        end
    
end
