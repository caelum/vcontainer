$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'vcontainer'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  
end

module EmailSender
end

class EmailTemplate
end

class SimpleEmailSender < EmailTemplate
  include EmailSender
end

class BasicComponent
  attr_reader :sender
  def initialize(simpleEmailSender)
    @sender = simpleEmailSender
  end
end
