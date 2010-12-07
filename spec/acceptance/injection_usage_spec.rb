require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VContainer::SimpleProvider do
  
  before do
    @container = VContainer::Container.new
  end
  
  it "support dependency injection when providing a service" do
    @container.use VContainer::SimpleProvider.new(BasicComponent)
    @container.use VContainer::SimpleProvider.new(SimpleEmailSender)
    basic = @container.provide(BasicComponent)
    basic.sender.class.should == SimpleEmailSender
  end

  it "support dependency injection based on a module" do
    @container.use VContainer::SimpleProvider.new(EmailComponent)
    @container.use VContainer::SimpleProvider.new(SimpleEmailSender)
    basic = @container.provide(EmailComponent)
    basic.sender.class.should == SimpleEmailSender
  end
  
end
