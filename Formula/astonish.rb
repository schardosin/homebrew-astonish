# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.6.10"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.10/astonish-darwin-amd64"
      sha256 "aceffe011de039716e8d2a205369157da836c756b6bbc4b99a0b6016ef12c18f"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.10/astonish-darwin-arm64"
      sha256 "c13ab057dcf5030035af92c56771bbe906b76c92cfe70ea34ef3630448dd64eb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.10/astonish-linux-amd64"
      sha256 "8b3dead24985d878b29f919d617a2f918111fa500247985d457b55fe822a0c56"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.10/astonish-linux-arm64"
      sha256 "9f1af7094867d3597d30d13702d8e600b8b73d3138a2e1c18ae4468fcbbdc450"
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
