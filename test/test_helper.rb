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
  def load_fixture(filename)
    File.read(File.dirname(__FILE__) + "/fixtures/#{filename}")
  end
end