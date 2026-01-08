# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.6.10"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.10/astonish-darwin-amd64"
      sha256 "b1939e5b1d11286856a57573678a336a65581c37c5fc0a9ea2c34821f7ab78dd"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.10/astonish-darwin-arm64"
      sha256 "b2d4b37510b929d7de8c4649f430f9cab9b431cb18ad71799b910fb03a4318ae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.10/astonish-linux-amd64"
      sha256 "4a50fb2faa8efcffeb564750aadd73ecda51588005c88728a70d5be6ea658b05"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.10/astonish-linux-arm64"
      sha256 "156f55552309d7987065b4bd21520509aefba69bf81e512f73ec5af2d9f9f28c"
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
