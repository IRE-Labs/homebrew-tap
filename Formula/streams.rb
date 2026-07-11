# typed: false
# frozen_string_literal: true

# Interim formula: installs a prebuilt binary committed to this tap.
# Once CI/CD publishes release artifacts, switch `url` to GitHub release assets.
class Streams < Formula
  desc "Streams platform CLI — data vault, studio smart cards, pipelines, feedback"
  homepage "https://studio.streamsplatform.dev"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "file://#{__dir__}/../bin/streams-v0.2.0-darwin-arm64"
      sha256 "cb389bbc10a9462dd231865bfa4e0440d380df5c7d98393a5ba0f5d8eba7b4fd"
    else
      url "file://#{__dir__}/../bin/streams-v0.2.0-darwin-amd64"
      sha256 "87c2415f22b992bdbb2d12c3a863d9410b7ce2895198006d01c20284205cd2e8"
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
