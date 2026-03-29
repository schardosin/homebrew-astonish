# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.5.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.0/astonish-darwin-amd64"
      sha256 "c0bf11801926459ffe7e77783335fdd03cf1ad26ff93d9e3d25829f23c669756"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.0/astonish-darwin-arm64"
      sha256 "75a417c9a7de2b2d2b676d0c40fd08ad704f0e311227efbafadcfc95f01183be"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.0/astonish-linux-amd64"
      sha256 "1a8008e54102e3ed7aad2998541fc79acbcf223d1f8524a1a510aabefcf645bc"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.0/astonish-linux-arm64"
      sha256 "7a88f99513da6ae4f2e2ebe393aac30bd84f95a3e779e8852dec2d081176b3d9"
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
