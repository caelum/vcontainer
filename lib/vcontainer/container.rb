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
    
    def provide_for_params(params)
      params.inject([]) do |values, param|
        values << provide(param[1])
      end
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