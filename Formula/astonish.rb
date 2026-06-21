# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "3.0.10"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.10/astonish-darwin-amd64"
      sha256 "2685e57921b34f8c3e868771e375739d648cead3e72942506106f77b42287290"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.10/astonish-darwin-arm64"
      sha256 "7ea34306ecf1a2d9f8fd4366534f18dc283429ce4060ab571c26be46d35de522"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.10/astonish-linux-amd64"
      sha256 "b328f6c159252bf36049db66d7f7420db7da03cad1cfe3f71d785e6c20ebf149"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.10/astonish-linux-arm64"
      sha256 "c5b8c01344bce79aed013a22a745abd9ef5d9aecbed7d0a9aacb35ea27305ca9"
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
