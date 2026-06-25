# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "3.0.15"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.15/astonish-darwin-amd64"
      sha256 "02e60a600d0e60af4b00dd1aea92e61b13d1be2f37a4a35cc4a8e3c6db2efe7e"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.15/astonish-darwin-arm64"
      sha256 "df7e6618b9afa20418db04f1df45a5f88ae722279c7894da1ba686b1dbd5fbe8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.15/astonish-linux-amd64"
      sha256 "d23cfbef65e7ebc3b9d1be8a6c632c38385f4344c87e637904b9c9621a28bef7"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.15/astonish-linux-arm64"
      sha256 "d5956b2f11024b208d972d369c7cf8739f917d2c3d0eb285c964ed48490d2319"
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
