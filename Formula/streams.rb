# typed: false
# frozen_string_literal: true

# Interim formula: installs a prebuilt binary committed to this tap.
# Once CI/CD publishes release artifacts, switch `url` to GitHub release assets.
class Streams < Formula
  desc "Streams platform CLI — data vault, studio smart cards, pipelines, demo library, feedback"
  homepage "https://studio.streamsplatform.dev"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "file://#{__dir__}/../bin/streams-v0.4.0-darwin-arm64"
      sha256 "905d265ec8760b38eb97952676d3c81af4390a89369c79b6f80062f4b3acfbcf"
    else
      url "file://#{__dir__}/../bin/streams-v0.4.0-darwin-amd64"
      sha256 "75e23fe5f6a1caa7e0089992766de88690d1c16a9c7f6e1b49ea1ae208e48d08"
    end
  end

  def install
    binary = Dir["streams-*"].first
    bin.install binary => "streams"
  end

  test do
    assert_match "streams v", shell_output("#{bin}/streams version")
  end
end
