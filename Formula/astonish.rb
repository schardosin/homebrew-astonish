# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.5.7"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.7/astonish-darwin-amd64"
      sha256 "c255b43ceb09a51996b6aee23098fb6f2cb2fb270507f190a9fdc4b6d593960d"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.7/astonish-darwin-arm64"
      sha256 "fed220a09143fed7f1012ae13a813d44c6f3eb25910ccad090948f86c1690dcb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.7/astonish-linux-amd64"
      sha256 "0bad6f4c11f44bd1f8d76ed42668d61d2010cc23c8be5e58ce181a634f6658a0"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.7/astonish-linux-arm64"
      sha256 "0dc00574f23ccceed81d6286d55488a35c60a8de5690b754f525bfa6b17652d0"
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
