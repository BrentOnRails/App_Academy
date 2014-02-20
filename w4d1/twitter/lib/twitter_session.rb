require 'addressable/uri'
require 'JSON'


CONSUMER_KEY = "JjhrdgnIFx48jXYoifHlA"
CONSUMER_SECRET = "vFmhkAXG0uRJSHj56M6fc4WchEtSdgfhGmMrUIATfE"
TOKEN_FILE = "access_token.yml"

CONSUMER = OAuth::Consumer.new(
  CONSUMER_KEY, CONSUMER_SECRET, :site => "https://twitter.com")

class TwitterSession
  # Both `::get` and `::post` should return the parsed JSON body.
  def self.get(path, query_values)
    url = self.path_to_url(path, query_values)
    JSON.parse(self.access_token.get(url).body)
  end

  def self.post(path, req_params)
    url = self.path_to_url(path, req_params)
    JSON.parse(self.access_token.post(url, req_params).body)
  end

  def self.access_token
    # We can serialize token to a file, so that future requests don't
    # need to be reauthorized.

    if File.exist?(TOKEN_FILE)
      # reload token from file
      YAML.load(File.read(TOKEN_FILE))
    else
      # copy the old code that requested the access token into a
      # `request_access_token` method.
      access_token = request_access_token
      File.open(TOKEN_FILE, "w") { |f| YAML.dump(access_token, f) }

      access_token
    end
    # "426819579-siQFhAPS7wYPUEGIeSqw8v8UxzcXZAJTMHqOMe2V"
  end

  def self.request_access_token
    # An `OAuth::Consumer` object can make requests to the service on
    # behalf of the client application.


    # Ask service for a URL to send the user to so that they may authorize
    # us.
    request_token = CONSUMER.get_request_token
    authorize_url = request_token.authorize_url

    # Launchy is a gem that opens a browser tab for us
    puts "Go to this URL: #{authorize_url}"
    Launchy.open(authorize_url)

    # Because we don't use a redirect URL; user will receive a short PIN
    # (called a **verifier**) that they can input into the client
    # application. The client asks the service to give them a permanent
    # access token to use.
    puts "Login, and type your verification code in"
    oauth_verifier = gets.chomp
    access_token = request_token.get_access_token(
      :oauth_verifier => oauth_verifier
    )

    access_token
  end

  def self.path_to_url(path, query_values = nil)
    # All Twitter API calls are of the format
    # "https://api.twitter.com/1.1/#{path}.json". Use
    # `Addressable::URI` to build the full URL from just the
    # meaningful part of the path (`statuses/user_timeline`)
    Addressable::URI.new(
      :scheme => "https",
      :host => "api.twitter.com",
      :path => "/1.1/#{path}.json",
      :query_values => query_values
    ).to_s
  end


end