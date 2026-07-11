# typed: false
# frozen_string_literal: true

# Interim formula: installs a prebuilt binary committed to this tap.
# Once CI/CD publishes release artifacts, switch `url` to GitHub release assets.
class Streams < Formula
  desc "Streams platform CLI — data vault, studio smart cards, pipelines, feedback"
  homepage "https://studio.streamsplatform.dev"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "file://#{__dir__}/../bin/streams-v0.1.0-darwin-arm64"
      sha256 "f1d2672a43efa92db8c8f0cfbb77eeec7fa1a646ca8955407d691a6751eb0d8f"
    else
      url "file://#{__dir__}/../bin/streams-v0.1.0-darwin-amd64"
      sha256 "7d1079f0a8cc307c89ac20a6886b82dcc48c21efb4dfbbcf079e2934960f63ec"
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
