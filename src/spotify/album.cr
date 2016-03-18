require "./resource"

module Spotify
  class Album < Resource
    @@resource = "albums"
    JSON.mapping({
      album_type: String,
      id:         String,
      name:       String,
      popularity: Int32,
      href:       String,
      images:     Array(Image),
    })
  end
end
