module Hashie
  class Dash < Hash
    def initialize(hash)
      self.class.properties.each_pair do |k, v|
        self[k] = v[:default]
      end
      hash.each_pair do |k, v|
        raise ArgumentError, 'Error' if self.class.properties[k][:required] && !v
        self[k] = v
      end
    end

    def self.properties
       @properties
    end

    def [](key)
      raise NoMethodError, "Error" unless self.class.properties.has_key? key
      super key
    end

    def self.property(prop_name, options = {})
      @properties ||= {}
      @properties[prop_name] = options

      define_method prop_name.to_s do
        self[prop_name]
      end

      define_method "#{prop_name.to_s}=" do |val|
        raise ArgumentError, 'Error' if self.class.properties[prop_name][:required] && !val
        self[prop_name] = val
      end

    end

  end

end
