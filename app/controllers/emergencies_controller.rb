class EmergenciesController < ApplicationController
    
    def new
        render status: 404, :json => { 'message' => 'page not found' }
    end
    
    def edit
        render status: 404, :json => { 'message' => 'page not found' }
    end
    
    def destroy
        render status: 404, :json => { 'message' => 'page not found' }
    end
    
end
