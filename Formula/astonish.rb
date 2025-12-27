# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.4.7"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.7/astonish-darwin-amd64"
      sha256 "4c7fbae62d019918f48b1609949e6e9b8bda0588c6b9c37360d9c8da117fb6c2"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.7/astonish-darwin-arm64"
      sha256 "05e59b59a75173f600a6b413f39f35384334110ca7db3829c558ab9e900a6349"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.7/astonish-linux-amd64"
      sha256 "fc333277f9e5030052c61bf9abf33d710671c72b81d4aee31023dd0da757f841"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.7/astonish-linux-arm64"
      sha256 "78ce4b84c4117336cb4bd659c3b5b4382f11cdefdaba68be91bca96be3722767"
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
