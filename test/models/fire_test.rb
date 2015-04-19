require "test_helper"

class FireTest < ActiveSupport::TestCase

  def fire
    @fire ||= Fire.new
  end

  def test_valid
    assert fire.valid?
  end

end
