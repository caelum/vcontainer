require 'active_support/inflector'

module VContainer
  
  # A basic container implementation
  class Container
    
    def use(provider)
      providers << provider
    end
    
    def provide(what)
      provider_for(what).build(what, self)
    end
    
    def can_provide?(what)
      provider_for(what) != nil
    end
    
    def provide_for_method(method)
      params = method.parameters
      has_parameters = params[0]!=[:rest]
      if has_parameters
        provide_instances_for(params)
      else
        []
      end
    end
    
    private
    def provide_instances_for(params)
      params.collect do |param|
        provide(param[1])
      end
    end
    
    def provider_for(what)
      providers.find {|p| p.can_handle?(what)}
    end
    
    private
    def providers
      @providers ||= []
    end
    
  end
  
end