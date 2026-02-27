# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.1.0/astonish-darwin-amd64"
      sha256 "047045f7cab227a46a8b95881cc9e5b192c7969ca08c6a3926bd6bb2eb065858"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.1.0/astonish-darwin-arm64"
      sha256 "7418bcd65b7931e0d37fa86a93fd30ddc62401ce5dc3dcd580d0df6f706abcd9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.1.0/astonish-linux-amd64"
      sha256 "aa44d18141af4f494ac37b3dd85b4acd5e35c0a4f242fdf002340e6a46bc104b"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.1.0/astonish-linux-arm64"
      sha256 "488234c3ba7237782e7561eee49d98083fd27cbac1e3350a45345afb8b85c231"
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
