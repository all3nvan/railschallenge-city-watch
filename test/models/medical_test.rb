require "test_helper"

class MedicalTest < ActiveSupport::TestCase

  def medical
    @medical ||= Medical.new
  end

  def test_valid
    assert medical.valid?
  end

end
