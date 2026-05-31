# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "3.0.8"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.8/astonish-darwin-amd64"
      sha256 "9aef648a8a7122eaa59791d15d10cfefc63e2af923c45955c59c703496c8ccdf"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.8/astonish-darwin-arm64"
      sha256 "b4f2cc5f9299bf76dcdfcab7599fa19aa6e34f746d09bb7a9eaad707e5bbcbf4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.8/astonish-linux-amd64"
      sha256 "34960cbe5658926c7ecb2c5d952b1777b1db4d02c932e68bfecf88148ac23d35"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.8/astonish-linux-arm64"
      sha256 "fd0e8e7cfc9b212a243f8dc58f80c967cca554e6742cd3e029f407a48f6059cc"
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
