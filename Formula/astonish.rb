# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.0/astonish-darwin-amd64"
      sha256 "1400f96821905e60b2759d4dfe939e97e1a90eaf914996152065c543e93fb8f0"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.0/astonish-darwin-arm64"
      sha256 "e8d6314ff5023fd6626ff5efbc8bb9877fc4cbeede34cc798db480ec4aadd5be"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.0/astonish-linux-amd64"
      sha256 "e230b144f07b279cf7722d9cc06f14bbc77412ae78fd35cb1cee78994c81d6e6"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.0/astonish-linux-arm64"
      sha256 "dde2558dcd04e84efc511ed5c33b956c7366574250ab937668aca33682288dc2"
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
