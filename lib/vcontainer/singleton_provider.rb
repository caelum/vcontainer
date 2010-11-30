module VContainer
  
  # A singleton provider will only instantiate a type once
  class SingletonProvider
    
    def initialize(build_type)
      @type = build_type
    end
    
    def build
      @cached_instance ||= @type.new
    end

    def can_handle?(what)
      @type == what.to_s.camelize.constantize
    end

  end
  
end