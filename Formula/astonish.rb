# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.2.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.1/astonish-darwin-amd64"
      sha256 "11dfaaaa8e38b739c6f63f3cfc63001e3e54a91fa3f00d9e28bd21301b601e34"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.1/astonish-darwin-arm64"
      sha256 "fbba68c4812f956809c52b1c0c40d67c4cf2236f621adde14d18c11a5980c84b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.1/astonish-linux-amd64"
      sha256 "ec22d3da3f1ab0fe0ca776329dcbb2140ed505f1e8eb5bb851ad98e45c0fc8d1"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.1/astonish-linux-arm64"
      sha256 "17a7c6e7e1bb26ea57a4e4dbe46f2fbd1914d0856f2c0267774c57247a40d141"
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
