require "./resource"

module Spotify
  class AlbumArtist
    JSON.mapping({
      external_urls: Hash(String, String),
      href:          String,
      id:            String,
      name:          String,
      type:          String,
      uri:           String,
    })
  end

  class Album < Resource
    @@resource = "albums"
    JSON.mapping({
      album_type: String,
      artists:    Array(AlbumArtist),
      id:         String,
      name:       String,
      popularity: Int32,
      href:       String,
      images:     Array(Image),
    })
  end
end

