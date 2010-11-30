module VContainer
  
  # A simple provider will instantiate a type everytime its required
  class SimpleProvider
    
    def initialize(build_type)
      @type = build_type
    end
    
    def build
      @type.new
    end
    
    def can_handle?(type)
      @type == type
    end
    
  end
  
end