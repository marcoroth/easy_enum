# frozen_string_literal: true

require 'easy_enum'

class Color < EasyEnum::EasyEnum
  easy_enum(green: 0, red: 1, blue: 2)
end
