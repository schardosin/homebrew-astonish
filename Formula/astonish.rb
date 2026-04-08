# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.6.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.3/astonish-darwin-amd64"
      sha256 "25a0558d3a46b776fffba636ed0dfc8c80770a83776d64f5083b468d78af7bad"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.3/astonish-darwin-arm64"
      sha256 "18b2239e116d6ef61c112ed4289170233a85189e14e456c53a91f8de24112322"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.3/astonish-linux-amd64"
      sha256 "66aeac031bbc831e4c055d3b425eb7e76ede5ebbe47cb7520c8e8875d1e73286"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.3/astonish-linux-arm64"
      sha256 "7b564d990c49b2c0022d1bfeff1ff357b20e8d308e3985508a0316d531ff87bd"
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
