# frozen_string_literal: true

require 'easy_enum/version'
require 'easy_enum/easy_enum'

module EasyEnum
  class ValueNotInEnum < StandardError; end

  class KeyNotInEnum < StandardError; end
end
