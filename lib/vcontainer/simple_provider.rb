require 'active_support/inflector'

module VContainer
  
  # A simple provider will instantiate a type everytime its required
  class SimpleProvider
    
    def initialize(build_type)
      @type = build_type
    end
  
    def build(container = nil)
      params = @type.instance_method(:initialize).parameters
      if params[0]==[:rest]
        @type.new
      else
        values = container.provide_for_params(params)
        @type.new *values
      end
    end
    
    def can_handle?(what)
      @type == what.to_s.camelize.constantize
    end
    
  end
  
end