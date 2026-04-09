# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.6.6"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.6/astonish-darwin-amd64"
      sha256 "4a39d431a93b186ff337b5531202bd5a079f4f2db155407961881971162ac936"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.6/astonish-darwin-arm64"
      sha256 "8eb5c21a825f3a36c52068bbfa114f1fc440214b36d10471351daa7d02c447eb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.6/astonish-linux-amd64"
      sha256 "5662aff6077f60d0a6e53c6f11f3c533fdb0598fc335f62f77e9bb09fa3b1ab0"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.6/astonish-linux-arm64"
      sha256 "c00539ef26b118dbbe19486e0417c9b1687178b29e000783f148609f1c4eb589"
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
