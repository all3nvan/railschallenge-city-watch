class Emergency < ActiveRecord::Base
    
    validates :code, presence: true, uniqueness: true
    validates :fire_severity, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :police_severity, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :medical_severity, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates_absence_of :id, message: 'found unpermitted parameter: id'
    validates_absence_of :resolved_at, message: 'found unpermitted parameter: resolved_at'
    
    def get_error_messages
       return { 'message' => errors[:id].first } if errors.include?(:id)
       return { 'message' => errors[:resolved_at].first } if errors.include?(:resolved_at)
       { 'message' => errors.messages }
    end
    
end
