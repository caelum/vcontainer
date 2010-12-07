require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VContainer::SimpleProvider do
  it "always return different instances" do
    provider = VContainer::SimpleProvider.new(SimpleEmailSender)
    provider.build(:simpleEmailSender).should_not == provider.build(:simpleEmailSender)
  end
  
  it "can handle a type's module" do
    provider = VContainer::SimpleProvider.new(SimpleEmailSender)
    provider.can_handle?(:emailSender).should be_true
  end

  it "can handle a type's superclass" do
    provider = VContainer::SimpleProvider.new(SimpleEmailSender)
    provider.can_handle?(:emailTemplate).should be_true
  end
end
