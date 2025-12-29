# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.0/astonish-darwin-amd64"
      sha256 "e4ad6fcc928f06544d3c54812ecdd944ce359e76d801f98b9da17a05da33be79"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.0/astonish-darwin-arm64"
      sha256 "e69552cc13c1c2bc2c98dc481737f715c3acd9542ee0b97cdd79c2aed1915d53"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.0/astonish-linux-amd64"
      sha256 "6e65c2dc1abd6ee4cee49b1d38927e1963bd78614273cb04d3305d8c14424f99"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.0/astonish-linux-arm64"
      sha256 "f5e05d42551b726e911a6e7c57c93b07d2df3f1d3ea58feb49b8085bcd98a932"
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
