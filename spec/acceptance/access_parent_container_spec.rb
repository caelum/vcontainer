require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VContainer::ParentProvider do
  
  before do
    @container = VContainer::ContainerDsl.new
  end
  
  it "looks up on its parents prior to providing something" do
    @container.register SimpleEmailSender
    
    basic_container = VContainer::ContainerDsl.new(@container)
    basic_container.register BasicComponent
    
    email_cc = VContainer::ContainerDsl.new(@container)
    email_cc.register EmailComponent
    
    basic_container.provide(:component).should be_kind_of(BasicComponent)
    basic_container.provide(:component).sender.class.should == SimpleEmailSender
    
    email_cc.provide(:component).should be_kind_of(EmailComponent)
    email_cc.provide(:component).sender.class.should == SimpleEmailSender
  end

end
