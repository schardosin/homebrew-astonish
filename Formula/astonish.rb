# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.0.6"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.6/astonish-darwin-amd64"
      sha256 "81d51876ec4de7658e7c296acbe4825ad6cb9cdee64254a9e4272f5fd1127e76"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.6/astonish-darwin-arm64"
      sha256 "04d6255a3b94c76ebb792b4f75805a32f159182478a9c6f47f1a4d9e76a7fad6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.6/astonish-linux-amd64"
      sha256 "b4abdbd38442c262b16399edc1e4a209a837015535d65721fd9f6d1b4523e403"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.6/astonish-linux-arm64"
      sha256 "b3415fdba4dc02a3ac7b9a52cdc9a70ce2248af9437ddaad9df9fa7d1c1d2470"
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
