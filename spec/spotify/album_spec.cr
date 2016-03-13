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
  end
end
