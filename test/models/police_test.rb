require "test_helper"

class PoliceTest < ActiveSupport::TestCase

  def police
    @police ||= Police.new
  end

  def test_valid
    assert police.valid?
  end

end
