class CompleteAlbum < Formula
  desc "Write Picard-compatible MusicBrainz tags and Cover Art Archive artwork into FLAC albums"
  homepage "https://github.com/oak443/complete-album"
  url "https://github.com/oak443/complete-album/archive/refs/tags/v0.1.1.tar.gz"
  # Replace with the source tarball checksum before publishing the tap:
  #   curl -L "https://github.com/oak443/complete-album/archive/refs/tags/v0.1.1.tar.gz" | shasum -a 256
  sha256 "88bdf689e445f0ee83cf4ca63dd6d1922a090ee860319ef131040a61ae5fb14f"
  license "GPL-3.0-only"
  head "https://github.com/oak443/complete-album.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/complete-album --version")
  end
end
