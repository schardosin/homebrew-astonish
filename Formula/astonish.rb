# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.6.19"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.19/astonish-darwin-amd64"
      sha256 "47867a276738d2b797875ae2074f290cb92ff24b75841ffcc2699298d614234e"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.19/astonish-darwin-arm64"
      sha256 "617a93dacc9bec2961120df135c5c4518f127fcdfd015570b1afd36565d4a6bb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.19/astonish-linux-amd64"
      sha256 "669ae3a3df5e44d1732e785705be8519885005284704f8d13383ad1baa5a76f9"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.19/astonish-linux-arm64"
      sha256 "bb3c4087b5750f63512cd23a50e160ecac427affe31ca4c37e7553be80ffc9ec"
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
