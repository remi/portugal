$:.unshift File.join(File.dirname(__FILE__), *%w[.. lib])

require "rspec"
require "portugal"

RSpec.configure do |config|
  config.before :each do
    Portugal.configure do |config|
      config.migrations_path = File.expand_path(__FILE__)
      config.verbose = false
    end
  end
end
