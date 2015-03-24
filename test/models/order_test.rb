require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "should set number after create" do
    assert Order.create.number.present?
  end
end
