require 'test_helper'

class SimpleEnumTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SimpleEnum::VERSION
  end
end
