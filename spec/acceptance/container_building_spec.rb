require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VContainer::SimpleProvider do
  
  before do
    @container = VContainer::ContainerDsl.new
  end
  
  it "support straight class registering" do
    @container.register BasicComponent, SimpleEmailSender
    basic = @container.provide(:basicComponent)
    basic.sender.class.should == SimpleEmailSender
  end

end
