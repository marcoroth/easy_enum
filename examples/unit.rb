# frozen_string_literal: true

require 'easy_enum'

class Unit < EasyEnum::EasyEnum
  self.easy_enum = {
    meter: 0,
    yard: 1,
    feet: 2
  }
end
