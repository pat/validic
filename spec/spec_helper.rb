require 'validic'
require 'pry'
require 'webmock/rspec'
require 'json'

RSpec.configure do |config|
  config.before(:each) do
    Validic.configure do |c|
      c.api_url = 'https://api.validic.com'
      c.api_version = 'v1'
      c.access_token = '1'
      c.organization_id = '1'
    end
  end
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def fixture_path
  File.expand_path('../fixtures', __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end

def a_delete(path)
  a_request(:delete, Validic::BASE_URL + path)
end

def a_get(path)
  a_request(:get, Validic::BASE_URL + path)
end

def a_post(path)
  a_request(:post, Validic::BASE_URL + path)
end

def a_put(path)
  a_request(:put, Validic::BASE_URL + path)
end

def stub_delete(path)
  stub_request(:delete, Validic::BASE_URL + path)
end

def stub_get(path)
  stub_request(:get, Validic::BASE_URL + path)
end

def stub_post(path)
  stub_request(:post, Validic::BASE_URL + path)
end

def stub_put(path)
  stub_request(:put, Validic::BASE_URL + path)
end
