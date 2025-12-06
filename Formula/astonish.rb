# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.0.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.4/astonish-darwin-amd64"
      sha256 "0612cc3f14a1cb19ee9803e0492e51333d534b55e8b933441647b94b8966d73d"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.4/astonish-darwin-arm64"
      sha256 "a336d6372ae6e5cbad12429a67248ec6f5b88a48d4fa5c6dba805ea638083a01"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.4/astonish-linux-amd64"
      sha256 "b6217904471b2602f88fa1c81cd63993227e3c9d53c40d6a1cc11e49467c8583"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.4/astonish-linux-arm64"
      sha256 "7f69fa5ad48a348e81f61819f2550f14c22593004c143e27a25a5e5f6767f6a2"
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
