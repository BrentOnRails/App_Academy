require 'addressable/uri'
require 'RestClient'
require 'JSON'
require 'nokogiri'


def find_items_of_interest(geometry, item_of_interest)
  Addressable::URI.new(
    :scheme => "https",
    :host => "maps.googleapis.com",
    :path => "maps/api/place/nearbysearch/json",
    :query_values => {"key" => "AIzaSyBKAxSFJcMcN2hc_ddNZqWanLvchrJhDVM",
                      "location" => geometry,
                      "radius" => 500,
                      "sensor" => false,
                      "keyword" => item_of_interest}
  ).to_s
end

def geocode_address(address)
  Addressable::URI.new(
    :scheme => "https",
    :host => "maps.googleapis.com",
    :path => "/maps/api/geocode/json",
    :query_values => { "address" => address,
                       "sensor" => false
                       # "key" => "AIzaSyBKAxSFJcMcN2hc_ddNZqWanLvchrJhDVM"
    }
  ).to_s
end

def get_directions(origin, destination)
  Addressable::URI.new(
    :scheme => "https",
    :host => "maps.googleapis.com",
    :path => "/maps/api/directions/json",
    :query_values => { "origin" => origin,
                       "destination" => destination,
                       "sensor" => false }
    ).to_s
end

def find_closest(geometry)
  puts "what would you like to find?"
  item_of_interest = gets.chomp
  url = find_items_of_interest(geometry, item_of_interest)
  returned_info = RestClient.get(url)
  all_ice_creams = JSON.parse(returned_info)["results"]
  closest_ice_cream = all_ice_creams.first

  address = closest_ice_cream["vicinity"]
  name = closest_ice_cream["name"]
  rating = closest_ice_cream["rating"]

  puts "#{name} ice cream is at #{address}. It's got #{rating} stars."
  address
end

def get_starting_address(input)
  url = geocode_address(input)
  geo_results = RestClient.get(url)
  json_geo_results = JSON.parse(geo_results)

  location = json_geo_results["results"].first["geometry"]["location"]
  lat, lng = location["lat"], location["lng"]
  geometry = "#{lat},#{lng}"
end

def directions_to_ice_cream
  puts "enter current address:"
  origin = gets.chomp
  geometry = get_starting_address(origin)
  destination = find_closest(geometry)
  directions_url = get_directions(origin, destination)
  print_directions(directions_url)
end

def print_directions(url)
  directions_results = JSON.parse(RestClient.get(url))
  steps = directions_results["routes"].first["legs"].first["steps"]
  html = []
  steps.each do |step|
    puts Nokogiri::HTML(step["html_instructions"]).text
    puts "-----"
  end
end

directions_to_ice_cream