# typed: false
# frozen_string_literal: true

# Interim formula: installs a prebuilt binary committed to this tap.
# Once CI/CD publishes release artifacts, switch `url` to GitHub release assets.
class Streams < Formula
  desc "Streams platform CLI — data vault, studio smart cards, pipelines, feedback"
  homepage "https://studio.streamsplatform.dev"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "file://#{__dir__}/../bin/streams-v0.3.0-darwin-arm64"
      sha256 "6033b810a80ba4983c30a8c0550b4f6c1bfe6be256073fa4654701d6cdc94120"
    else
      url "file://#{__dir__}/../bin/streams-v0.3.0-darwin-amd64"
      sha256 "60c6dfd3e5b40cf495f12a3bd9db94a3c76f83fea4860b20baad545e03b61c95"
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
