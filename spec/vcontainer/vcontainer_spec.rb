require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

class SimpleEmailSender
end

describe VContainer::SingletonProvider do
  it "always return the same singleton instance" do
    provider = VContainer::SingletonProvider.new(SimpleEmailSender)
    provider.build.should == provider.build
  end
end
