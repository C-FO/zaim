require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start

require 'zaim'
require 'minitest/autorun'
require 'webmock/minitest'

WebMock.disable_net_connect!(allow: 'coveralls.io')
