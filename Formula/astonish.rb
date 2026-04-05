# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.5.12"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.12/astonish-darwin-amd64"
      sha256 "f04d01c1f33e4efc880cec81b3e1f151ca77efce2a9b438d5ceb767d10cb285d"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.12/astonish-darwin-arm64"
      sha256 "53c0ab9e472f60be35c09220b33a6fe8c6a1ff7f621989c9f8ffeb36d9e5b98f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.12/astonish-linux-amd64"
      sha256 "8cb0d0e6fde95d5162ac03b2ecc41a522190036c2cf506d23df447a3961ba112"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.12/astonish-linux-arm64"
      sha256 "6351abaaf6612bec2476cf92696c09cc6132c2c2bcf42bb7bbb1761659551648"
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
