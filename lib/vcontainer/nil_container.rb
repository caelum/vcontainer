module VContainer
  
  class NilContainer
    
    def provide_for_method(method)
      []
    end
    
    def can_provide?(what)
      false
    end
    
  end
  
end