require "json"
require "http/client"

module Spotify
  class Track
    getter :id, :name
    JSON.mapping({
      id:  String,
      name: String
    })

    def initialize(@id : String, @name : String); end

    def self.find(id : String)
      response = HTTP::Client.get("https://api.spotify.com/v1/tracks/#{id}")

      return from_json(response.body)
    end
  end
end