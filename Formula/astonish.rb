# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.5.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.5/astonish-darwin-amd64"
      sha256 "a09c4aa004918d7745185df120bfa9416634d64fc13025fd4ccc9d68d2f463e8"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.5/astonish-darwin-arm64"
      sha256 "7809d0e1d692569f57dd00223fd243a8a389a4ce45067de4ed264b87403eacef"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.5/astonish-linux-amd64"
      sha256 "7fb35afed0c1917929398dc686bb58e97405a3dac89e60920867bf9f97d4e6b6"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.5/astonish-linux-arm64"
      sha256 "a1179e460404671c6527bec916c24f3cdbd008ce977b3cb2b0ff42c7262d9b8d"
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
