# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.6.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.3/astonish-darwin-amd64"
      sha256 "0d44ad2109c37e7edc4228762333fb9a3d0422fb173c01e3ea81140fb40a0468"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.3/astonish-darwin-arm64"
      sha256 "b191cfd6346f222e09e77206dc40a4834fc9d1ef9224a3cf5ed3b0d6601e2011"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.3/astonish-linux-amd64"
      sha256 "127e6ccb65fbb7346ef460ce7d1fa303b07905c4fe3e45080fd6279ce650cea8"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.3/astonish-linux-arm64"
      sha256 "3797d745a88b938729af49c34bad972bc4c87c66d3d0077eeb7950da354a4cef"
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
