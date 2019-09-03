# Add simplecov
require "simplecov"
SimpleCov.start do
  add_filter "test/" # Tests should not be checked for coverage.
end
require "minitest"
require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative "../lib/hotel_system.rb"
require_relative "../lib/date_range.rb"
