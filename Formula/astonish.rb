# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.5.9"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.9/astonish-darwin-amd64"
      sha256 "f3d03fa3418f9f82eac7564741f254d428f1ae7aa49d293f6bd2163c3924cb28"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.9/astonish-darwin-arm64"
      sha256 "b910325e8dc0979b298f99ced7da141780eb758448b83a358cdff945ade254df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.9/astonish-linux-amd64"
      sha256 "48bbba3fec09fdb5afcdabbde469b36535afa1ebf6cfd055551cf39aa44ce9f8"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.9/astonish-linux-arm64"
      sha256 "61815797cd2ca1abb125b2c7c1ecf932f1fb53b2322a35cb1257a7ea446a26e2"
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
