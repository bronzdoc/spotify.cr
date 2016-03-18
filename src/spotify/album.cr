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

  class AlbumTrack
    JSON.mapping({
      artists:           Array(AlbumArtist),
      available_markets: Array(String),
      disc_number:       Int32,
      duration_ms:       Int32,
      explicit:          Bool,
      external_urls:     Hash(String, String),
      href:              String,
      id:                String,
      name:              String,
      preview_url:       String,
      track_number:      Int32,
      type:              String,
      uri:               String,
    })
  end

  class AlbumTracks
    JSON.mapping({
      href:     String,
      items:    Array(AlbumTrack),
      limit:    Int32,
      next:     { type: String, nilable: true },
      offset:   Int32,
      previous: { type: String, nilable: true },
      total:    Int32,
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
      album_type:             String,
      artists:                Array(AlbumArtist),
      available_markets:      Array(String),
      copyrights:             Array(Copyright),
      external_ids:           Hash(String, String),
      external_urls:          Hash(String, String),
      genres:                 Array(String),
      id:                     String,
      name:                   String,
      popularity:             Int32,
      href:                   String,
      images:                 Array(Image),
      release_date:           String,
      release_date_precision: String,
      tracks:                 AlbumTracks,
      type:                   String,
    })
  end
end

