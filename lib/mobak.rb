require 'net/http'
require 'uri'
require 'digest'
require 'mobak/configuration'
require 'mobak/sender'

module Mobak

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

end

require './config/initializers/mobak'
