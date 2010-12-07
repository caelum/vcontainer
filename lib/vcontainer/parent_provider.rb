module VContainer
  
  # A simple provider that looks up into a parent to provide something
  class ParentProvider
    
    def initialize(parent)
      @parent = parent
    end
  
    def build(what, container = NilContainer.new)
      @parent.provide(what)
    end
    
    def can_handle?(what)
      @parent.can_provide?(what)
    end
    
  end
  
end