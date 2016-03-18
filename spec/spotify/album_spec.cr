require "./../spec_helper"

describe Spotify::Album do
  let(response) { Fixture.load("album.json") }

  before do
    WebMock.stub(:get, "https://api.spotify.com/v1/albums/7rSZXXHHvIhF4yUFdaOCy9").to_return(response)
  end

  context "when finding" do
    let(album) { Spotify::Album.find("7rSZXXHHvIhF4yUFdaOCy9") }

    it "finds an album by id" do
      expect(album.name).to eq("Are You Experienced")
    end
  end

  context "when parsing from JSON" do
    let(album) { Spotify::Album.from_json(response) }

    it "populates the album type" do
      expect(album.album_type).to eq("album")
    end

    it "should populate artists" do
      expect(album.artists).to be_a(Array(Spotify::AlbumArtist))
    end

    it "should populate available_markets" do
      expect(album.available_markets).to be_a(Array(String))
    end

    it "should populate copyrights" do
      expect(album.copyrights).to be_a(Array(Spotify::Copyright))
      expect(album.copyrights.size).to eq(1)
      expect(album.copyrights.first.text).to eq("(P) 2000 Sony Music Entertainment Inc.")
      expect(album.copyrights.first.type).to eq("P")
    end

    it "should populate external_ids" do
      expect(album.external_ids).to be_a(Hash(String, String))
      expect(album.external_ids["upc"]).to eq("5099749994324")
    end

    it "should populate external_urls" do
      expect(album.external_urls).to be_a(Hash(String, String))
      expect(album.external_urls["spotify"]).to eq("https://open.spotify.com/album/0sNOF9WDwhWunNAHPD3Baj")
    end

    it "should populate genres" do
      expect(album.genres).to be_a(Array(String))
      expect(album.genres.empty?).to be_true
    end

    it "populates the id" do
      expect(album.id).to eq("7rSZXXHHvIhF4yUFdaOCy9")
    end

    it "populates the name" do
      expect(album.name).to eq("Are You Experienced")
    end

    it "populates the popularity" do
      expect(album.popularity).to eq(73)
    end

    it "populates the href" do
      expect(album.href).to eq("https://api.spotify.com/v1/albums/7rSZXXHHvIhF4yUFdaOCy9")
    end

    it "populates the image" do
      expect(album.images.size).to eq(3)
      expect(album.images).to be_a(Array(Spotify::Image))
    end

    it "should populate release_date" do
      expect(album.release_date).to be_a(String)
      expect(album.release_date).to eq("1983")
    end

    it "should populate release_date_precision" do
      expect(album.release_date_precision).to be_a(String)
      expect(album.release_date_precision).to eq("year")
    end
  end
end
