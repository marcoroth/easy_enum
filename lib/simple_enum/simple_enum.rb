module SimpleEnum
  class SimpleEnum
    attr_reader :value

    class << self
      attr_writer :simple_enum
    end

    def initialize(value)
      self.value = value
    end

    def self.simple_enum(simple_enum = {})
      @simple_enum ||= simple_enum
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
      self.class.simple_enum.each do |key, val|
        return key if value == val
      end

      nil
    end

    def self.members
      simple_enum
    end

    def self.keys
      simple_enum.keys
    end

    def self.values
      simple_enum.values
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
      simple_enum.count
    end

    def ==(other)
      if other.is_a? self.class
        other.key == key
      elsif other.is_a? Symbol
        other == key
      else
        other == value
      end
    end

    def method_missing(method, *args) # rubocop:disable Style/MissingRespondToMissing
      self.class.simple_enum.each do |key, val|
        return val == value if method == "#{key}?".to_sym
      end

      super
    end

    def self.method_missing(method, *args) # rubocop:disable Style/MissingRespondToMissing
      return key(method) if keys.include?(method)

      super
    end
  end
end
