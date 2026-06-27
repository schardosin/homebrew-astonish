# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "3.0.20"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.20/astonish-darwin-amd64"
      sha256 "23b0f736fdc4a9c2ec52323a73f30ab588bf1ee9d8af2ea48ef5d6b41b254140"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.20/astonish-darwin-arm64"
      sha256 "2dd3453f7ff095653defc48c50637975e0a9dd33cfd55cf1f065371017306746"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.20/astonish-linux-amd64"
      sha256 "8f1fea1797c2696498bbbf335a5f4fbda1c15cb74064b707dfc20a06e857c9a4"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.20/astonish-linux-arm64"
      sha256 "43b5b6cdccdbfc2cf45e37b0341cd43bf52f7907930033697c790df9d2894f04"
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
