# frozen_string_literal: true

module EasyEnum
  class EasyEnum
    attr_reader :value

    class << self
      attr_writer :easy_enum
    end

    def initialize(value)
      self.value = value
    end

    def self.easy_enum(easy_enum = {})
      @easy_enum ||= easy_enum
    end

    def value=(value)
      if self.class.values.include?(value)
        @value = value
        return
      end
      raise ValueNotInEnum
    end

    def key=(key)
      if self.class.keys.include?(key)
        @value = self.class.members[key]
        return
      end
      raise KeyNotInEnum
    end

    def key
      self.class.easy_enum.each do |key, val|
        return key if value == val
      end

      nil
    end

    def self.members
      easy_enum
    end

    def self.keys
      easy_enum.keys
    end

    def self.values
      easy_enum.values
    end

    def self.key(key)
      value = members[key]
      return new(value) if value

      nil
    end

    def self.value(value)
      return new(value) if values.include? value

      nil
    end

    def self.key?(key)
      keys.include? key
    end

    def self.value?(value)
      values.include? value
    end

    def self.size
      easy_enum.count
    end

    def ==(other)
      case other
      when self.class
        other.key == key
      when Symbol
        other == key
      else
        other == value
      end
    end

    def method_missing(method, *args)
      self.class.easy_enum.each do |key, val|
        return val == value if method == "#{key}?".to_sym
      end

      super
    end

    def respond_to_missing?(method, *)
      return true if self.class.easy_enum.keys.map { |key| "#{key}?".to_sym }.include?(method)

      super
    end

    def self.method_missing(method, *args)
      return key(method) if keys.include?(method)

      super
    end

    def self.respond_to_missing?(method, *)
      return true if keys.include?(method)

      super
    end
  end
end
