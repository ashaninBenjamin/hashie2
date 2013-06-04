require 'bundler/setup'
Bundler.require

require 'minitest/autorun'
Minitest.autorun

if ENV["TRAVIS"]
  require 'coveralls'
  Coveralls.wear!
end

require 'simplecov'
SimpleCov.start if ENV['COVERAGE']

class TestCase < MiniTest::Test

  Dir[File.expand_path('../fixtures/*.rb', __FILE__)].each { |f| require f }

end
