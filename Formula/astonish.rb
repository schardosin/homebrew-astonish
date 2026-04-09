# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.6.7"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.7/astonish-darwin-amd64"
      sha256 "c5957d92a82842bb9febca0d6eca1782e060952c256456b3df58e1cbf93c1966"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.7/astonish-darwin-arm64"
      sha256 "b16263b2ce153955baf217276854d351f9df81920ec666ba956e1d70830057f4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.7/astonish-linux-amd64"
      sha256 "dc637bc30341b8b47e695b4a63242fb60062e882890a10cec32de36a396d19f3"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.7/astonish-linux-arm64"
      sha256 "77c93f1983bc9ecc6a1be00da4fb549a08e3a35c8840193d9b0383aa19e7578d"
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
