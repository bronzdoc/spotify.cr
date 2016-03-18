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

  class Copyright
    JSON.mapping({
      text: String,
      type: String,
    })
  end

  class Album < Resource
    @@resource = "albums"
    JSON.mapping({
      album_type:        String,
      artists:           Array(AlbumArtist),
      available_markets: Array(String),
      copyrights:        Array(Copyright),
      external_ids:      Hash(String, String),
      external_urls:     Hash(String, String),
      id:                String,
      name:              String,
      popularity:        Int32,
      href:              String,
      images:            Array(Image),
    })
  end
end

