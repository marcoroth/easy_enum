require 'test_helper'

module SimpleEnum
  class Color < SimpleEnum
    simple_enum(green: 0, red: 1, blue: 2)
  end

  class SimpleEnumTest < Minitest::Test
    def test_creation
      assert_equal :green, Color.green.key
      assert_equal :red, Color.red.key
      assert_equal :blue, Color.blue.key

      assert_equal :green, Color.new(0).key
      assert_equal :red, Color.new(1).key
      assert_equal :blue, Color.new(2).key

      assert_equal :green, Color.key(:green).key
      assert_equal :red, Color.key(:red).key
      assert_equal :blue, Color.key(:blue).key

      assert_equal :green, Color.value(0).key
      assert_equal :red, Color.value(1).key
      assert_equal :blue, Color.value(2).key
    end

    def test_values
      green = Color.green
      assert_equal 0, green.value

      red = Color.red
      assert_equal 1, red.value

      blue = Color.blue
      assert_equal 2, blue.value
    end

    def test_checking
      color = Color.green
      assert color.green?
      assert !color.red?
      assert !color.blue?

      color = Color.red
      assert !color.green?
      assert color.red?
      assert !color.blue?

      color = Color.blue
      assert !color.green?
      assert !color.red?
      assert color.blue?
    end

    def test_exploring
      assert_equal ({ green: 0, red: 1, blue: 2 }), Color.members

      assert_equal %i[green red blue], Color.keys

      assert_equal [0, 1, 2], Color.values

      assert_equal true, Color.key?(:green)
      assert_equal true, Color.key?(:red)
      assert_equal true, Color.key?(:blue)
      assert_equal false, Color.key?(:yellow)

      assert_equal false, Color.value?(-1)
      assert_equal true, Color.value?(0)
      assert_equal true, Color.value?(1)
      assert_equal true, Color.value?(2)
      assert_equal false, Color.value?(3)
      assert_equal false, Color.value?('string')
    end

    def test_comparison
      green = Color.green

      assert green == :green
      assert green != :blue
      assert green != :red

      assert green != -1
      assert green == 0 # rubocop:disable Style/NumericPredicate
      assert green != 1
      assert green != 2
      assert green != 3

      assert green == Color.green
      assert green != Color.red
      assert green != Color.blue

      assert green == Color.key(:green)
      assert green != Color.key(:red)
      assert green != Color.key(:blue)

      assert green == Color.value(0)
      assert green != Color.value(1)
      assert green != Color.value(2)
    end

    def test_redefining
      color = Color.green
      assert_equal 0, color.value
      assert_equal :green, color.key

      color.value = 1
      assert_equal 1, color.value
      assert_equal :red, color.key

      color.value = 2
      assert_equal 2, color.value
      assert_equal :blue, color.key

      assert_raises KeyNotInEnum do
        color.key = :yellow
      end

      assert_raises ValueNotInEnum do
        color.value = 3
      end
    end
  end
end
