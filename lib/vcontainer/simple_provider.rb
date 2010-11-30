module VContainer
  
  # A simple provider will instantiate a type everytime its required
  class SimpleProvider
    
    def initialize(build_type)
      @type = build_type
    end
  
    def build(container = NilContainer.new)
      values = container.provide_for_method(@type.instance_method(:initialize))
      @type.new *values
    end
    
    def can_handle?(what)
      @type == what.to_s.camelize.constantize
    end
    
  end
  
end