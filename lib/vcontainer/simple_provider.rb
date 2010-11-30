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
        values = params.inject([]) do |values, param|
          provide_me_a = param[1].to_s.camelize.constantize
          values << container.provide(provide_me_a)
        end
        @type.new *values
      end
    end
    
    def can_handle?(type)
      @type == type
    end
    
  end
  
end