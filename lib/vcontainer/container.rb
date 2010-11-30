require 'active_support/inflector'

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
    
    def provide_for_method(method)
      params = method.parameters
      if params[0]==[:rest]
        []
      else
        params.inject([]) do |values, param|
          values << provide(param[1])
        end
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