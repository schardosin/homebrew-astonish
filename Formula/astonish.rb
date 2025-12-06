# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.0/astonish-darwin-amd64"
      sha256 "213d182e0b36f2c9bc1cd34d814bf990e57ce4b6d9a535e58d597e34ab6ff6ce"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.0/astonish-darwin-arm64"
      sha256 "813d242fe31c5fe94d5154751fea057c9b72210378383c697533003ed60782a6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.0/astonish-linux-amd64"
      sha256 "dfac45de58688648a215a71b93a009dece11d6601e604c0c7332c6b00b83229a"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.0/astonish-linux-arm64"
      sha256 "93f590bef536bc34dbb8759f07bd36ab048bc60402f0ff9f742e243d48c806f4"
    end
  end

  def install
    binary_name = "astonish"
    
    # The downloaded file might have different names based on platform
    # We need to find and rename it
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
