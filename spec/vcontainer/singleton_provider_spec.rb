require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VContainer::SingletonProvider do
  it "always return the same singleton instance" do
    provider = VContainer::SingletonProvider.new(SimpleEmailSender)
    provider.build(:simpleEmailSender).should == provider.build(:simpleEmailSender)
  end

  it "can handle a type's module" do
    provider = VContainer::SingletonProvider.new(SimpleEmailSender)
    provider.can_handle?(:emailSender).should be_true
  end

  it "can handle a type's superclass" do
    provider = VContainer::SingletonProvider.new(SimpleEmailSender)
    provider.can_handle?(:emailTemplate).should be_true
  end
end
