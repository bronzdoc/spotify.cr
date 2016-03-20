require "./../spec_helper"

describe Spotify::Track do
  let(response) { Fixture.load("track.json") }

  before do
    WebMock.stub(:get, "https://api.spotify.com/v1/tracks/0wJoRiX5K5BxlqZTolB2LD").to_return(response)
  end

  context "when finding" do
    let(track) { Spotify::Track.find("0wJoRiX5K5BxlqZTolB2LD") }

    it "finds a track by id" do
      expect(track.name).to eq("Mr. Brightside")
    end
  end

  context "when parsing from JSON" do
    let(track) { Spotify::Track.from_json(response) }

    it "populates album" do
      expect(track.album).to be_a(Spotify::TrackAlbum)
      expect(track.album.album_type).to eq("album")
    end

    it "populates artists" do
      expect(track.artists).to be_a(Array(Spotify::TrackArtist))
      expect(track.artists.size).to eq(1)
    end

    it "populates the id" do
      expect(track.id).to eq("0eGsygTp906u18L0Oimnem")
    end

    it "populates the name" do
      expect(track.name).to eq("Mr. Brightside")
    end

    it "populates the popularity" do
      expect(track.popularity).to eq(0)
    end

    it "populates the href" do
      expect(track.href).to eq("https://api.spotify.com/v1/tracks/0eGsygTp906u18L0Oimnem")
    end

    it "populates the track number" do
      expect(track.track_number).to eq(2)
    end
  end
end
