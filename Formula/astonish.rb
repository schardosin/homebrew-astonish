# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.7.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.7.1/astonish-darwin-amd64"
      sha256 "4e1ae678376213df0bcd7a3f5da87892ca8eab6a20e177b85b102588b4ebf33e"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.7.1/astonish-darwin-arm64"
      sha256 "dc3ff5093f826d2d323e824ef525711d23eac0aa092dda1fe7a35f8ebf2475b0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.7.1/astonish-linux-amd64"
      sha256 "d1f857e0a57ea9c0ab3181ec53617a02d5c2cfd64d9c4bd2d62c231414f62c94"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.7.1/astonish-linux-arm64"
      sha256 "6fd6bddc608f834b547b8b211a5fb5a387599ca40fa2311a784bf3b2b3ee7cdc"
    end
  end

  def install
    binary_name = "astonish"
    downloaded_file = Dir["astonish-*"].first || "astonish"
    
    if File.exist?(downloaded_file)
      bin.install downloaded_file => binary_name
    else
      bin.install binary_name
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/astonish --version", 2)
  end
end
