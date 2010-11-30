module VContainer
  
  # A basic container implementation
  class Container
    
    def use(provider)
      providers << provider
    end
    
    def provide(what)
      provider_for(what).build(self)
    end
    
    def can_provide?(what)
      provider_for(what) != nil
    end
    
    private
    def provider_for(what)
      providers.find {|p| p.can_handle?(what)}
    end
    
    private
    def providers
      @providers ||= []
    end
    
  end
  
end