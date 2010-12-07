module VContainer
  
  # A basic container implementation
  class ContainerDsl < Container
    
    def initialize(parent = NilContainer.new)
      register ParentProvider.new(parent)
    end
    
    def register(*provider)
      provider.each do |p|
        if p.kind_of? Class
          p = VContainer::SimpleProvider.new(p)
        end
        use(p)
      end
    end
 
  end
  
end