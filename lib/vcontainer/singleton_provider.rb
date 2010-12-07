module VContainer
  
  # A singleton provider will only instantiate a type once
  class SingletonProvider
    
    def initialize(build_type)
      @type = build_type
    end
    
    def build(what, container = NilContainer.new)
      @cached_instance ||= instantiate(container)
    end

    def can_handle?(what)
      @type == what.to_s.camelize.constantize
    end
    
    private
    def instantiate(container)
      values = container.provide_for_method(@type.instance_method(:initialize))
      @type.new *values
    end

  end
  
end