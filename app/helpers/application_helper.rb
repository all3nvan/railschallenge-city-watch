module ApplicationHelper
    
    def render_404
        render status: 404, json: { 'message' => 'page not found' }
    end
    
end
