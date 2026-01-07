# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.6.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.2/astonish-darwin-amd64"
      sha256 "275b002a657d6384add2e207b255f7bea5eadd0c85ddb5500f3c4ca20e190b2e"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.2/astonish-darwin-arm64"
      sha256 "e35a991e1b5e4d5535cc9b3500d8c7a3f49ca2fcd479d4bc2fcd882fd4eac4cf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.2/astonish-linux-amd64"
      sha256 "45b263ea82277aef497d97c82648bd952f1f7d37094da45ed9ec4235eef1b0b2"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.2/astonish-linux-arm64"
      sha256 "49b18adc8980091724292647faba00c613d24abb9e1f5462781e5818e61089cd"
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
