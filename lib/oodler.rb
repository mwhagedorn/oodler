
require 'rubygems'

gem 'roxml', '~> 3.1.3'
require 'roxml'

gem 'crack', '~> 0.1.4'
require 'crack'

gem 'httparty'
require 'httparty'

require 'cgi'

module Oodler
  class OodlerError < StandardError
    attr_reader :data

    def initialize(data)
      @data = data
      super
    end
  end
  
  class OodleArgumentError <OodlerError; end

  
  
  # config/initializers/oodler.rb (for instance)
  # 
  # Oodler.configure do |config|
  #   config.key = 'api_key'
  # end
  # 
  # elsewhere
  #
  # client = Oodler::Client.new
  def self.configure
    yield self
      
    Oodler.key = key
    true
  end
  
  def self.key
    @key
  end
  
  def self.key=(key)
    @key = key
  end
  
  
end

directory = File.expand_path(File.dirname(__FILE__))
require File.join(directory, "oodler", 'category')
require File.join(directory, "oodler", 'region')
require File.join(directory, 'oodler', 'web_client')
require File.join(directory, 'oodler', 'location')
require File.join(directory, 'oodler', 'image')
require File.join(directory, 'oodler', 'source')
require File.join(directory, 'oodler', 'category')
require File.join(directory, 'oodler', 'element')
require File.join(directory, 'oodler', 'oodle_response')
require File.join(directory, 'oodler', 'client')