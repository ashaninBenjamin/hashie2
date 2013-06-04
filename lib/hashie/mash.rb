module Hashie
  class Mash < Hash
    def initialize(hash = {})
      hash.each_pair do |k, v|
        self[k.to_s] = v
      end
    end

    def method_missing(method_name, *args, &block)
      case method_name.to_s[-1]
        when "?"
          !!(self[method_name.to_s.chomp("?")])
        when "="
          self[method_name.to_s.chomp("=")] = args.first
        else
          (self[method_name.to_s]) ? self[method_name.to_s] : nil
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      true
    end
  end
end
