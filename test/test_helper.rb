require 'test/unit'
require 'pathname'
require 'rubygems'

gem 'shoulda', '>= 2.10.1'
gem 'jnunemaker-matchy', '0.4.0'
gem 'mocha', '0.9.4'
gem 'fakeweb', '>= 1.2.5'
gem 'httparty', '>= 0.5.2'

require 'shoulda'
require 'matchy'
require 'mocha'
require 'fakeweb'
require 'httparty'

FakeWeb.allow_net_connect = false

dir = (Pathname(__FILE__).dirname + '../lib').expand_path
require dir + 'oodler'

class Test::Unit::TestCase
end

def fixture_file(filename)
  return '' if filename == ''
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/' + filename)
  File.read(file_path)
end

def oodle_url(url)
  url =~ /^http/ ? url : "http://api.oodle.com#{url}"
end

def stub_get(url, filename, status=nil)
  options = {:body => fixture_file(filename)}
  options.merge!({:status => status}) unless status.nil?
  
  FakeWeb.register_uri(:get, oodle_url(url), options)
end


