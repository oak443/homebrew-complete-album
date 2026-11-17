class CompleteAlbum < Formula
  desc "Write Picard-compatible MusicBrainz tags and Cover Art Archive artwork into FLAC albums"
  homepage "https://github.com/oak443/complete-album"
  url "https://github.com/oak443/complete-album/archive/refs/tags/v0.1.0.tar.gz"
  # Replace with the source tarball checksum before publishing the tap:
  #   curl -L "https://github.com/oak443/complete-album/archive/refs/tags/v0.1.0.tar.gz" | shasum -a 256
  sha256 "c723aea6d920a6ddced8c21cc1e12641418885f826e8aeabe6068773b8f6c984"
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
