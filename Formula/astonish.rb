# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "3.0.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.4/astonish-darwin-amd64"
      sha256 "f9cf496a139472b69f8b784c14d563fff355b37f7175e916cc8307e6e1f19f64"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.4/astonish-darwin-arm64"
      sha256 "27c54c1e17fc066e8d9f6f63de91c96dec72ae0086b64b8de9f289318aa3c34b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.4/astonish-linux-amd64"
      sha256 "bb87c9d3697d6dadb524697dc74396f6376d43bfd07939d3e9d5aab4cccef2f3"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.4/astonish-linux-arm64"
      sha256 "2bc205cae11fc9ac3f44b4ac285e18216feb8970a284e63ec3d34689ec74b327"
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
