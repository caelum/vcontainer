require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe VContainer::SimpleProvider do
  it "always return different instances" do
    provider = VContainer::SimpleProvider.new(SimpleEmailSender)
    provider.build.should_not == provider.build
  end
end
