require 'simple_enum/version'
require 'simple_enum/simple_enum'

module SimpleEnum
  class ValueNotInEnum < StandardError; end
  class KeyNotInEnum < StandardError; end
end
