require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start do
  add_filter 'vendor'
end

require 'zaim'
require 'minitest/autorun'
require 'webmock/minitest'

include WebMock::API

WebMock.disable_net_connect!(allow: 'coveralls.io')

def a_get(path)
  a_request(:get, Zaim::Configuration::ENDPOINT + path)
end

def a_post(path)
  a_request(:post, Zaim::Configuration::ENDPOINT + path)
end

def a_put(path)
  a_request(:put, Zaim::Configuration::ENDPOINT + path)
end

def a_delete(path)
  a_request(:delete, Zaim::Configuration::ENDPOINT + path)
end

def stub_get(path)
  stub_request(:get, Zaim::Configuration::ENDPOINT + path)
end

def stub_post(path)
  stub_request(:post, Zaim::Configuration::ENDPOINT + path)
end

def stub_put(path)
  stub_request(:put, Zaim::Configuration::ENDPOINT + path)
end

def stub_delete(path)
  stub_request(:delete, Zaim::Configuration::ENDPOINT + path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file).read
end
