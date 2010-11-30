require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VContainer::SimpleProvider do
  
  before do
    @container = VContainer::Container.new
  end
  
  it "support provider registration and so on" do
    @container.use VContainer::SimpleProvider.new(SimpleEmailSender)
    @container.provide(SimpleEmailSender).class.should == SimpleEmailSender
  end

  it "lets us know whether it can handle something" do
    @container.use VContainer::SimpleProvider.new(SimpleEmailSender)
    @container.can_provide?(SimpleEmailSender).should be_true
  end
  
  it "support provider registration with symbol" do
    @container.use VContainer::SimpleProvider.new(SimpleEmailSender)
    @container.provide(:simpleEmailSender).class.should == SimpleEmailSender
  end

  it "lets us know whether it can handle some symbol" do
    @container.use VContainer::SimpleProvider.new(SimpleEmailSender)
    @container.can_provide?(:simpleEmailSender).should be_true
  end
end
