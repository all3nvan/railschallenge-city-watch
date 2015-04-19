class Responder < ActiveRecord::Base
    
    validates :capacity, presence: true,
                         numericality: { greater_than_or_equal_to: 1,
                                         less_than_or_equal_to: 5 }
    validates :name, presence: true, uniqueness: true
    validates :type, presence: true
    validates_absence_of :emergency_code, message: 'found unpermitted parameter: emergency_code'
    validates_absence_of :id, message: 'found unpermitted parameter: id'
    validates_absence_of :on_duty, message: 'found unpermitted parameter: on_duty'
    
    def get_error_messages
        return { 'message' => errors[:id].first } if errors.include?(:id)
        return { 'message' => errors[:emergency_code].first } if errors.include?(:emergency_code)
        return { 'message' => errors[:on_duty].first } if errors.include?(:on_duty)
        { 'message' => errors.messages }
    end
    
end
