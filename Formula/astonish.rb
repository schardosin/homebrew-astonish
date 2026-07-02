# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "3.0.23"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.23/astonish-darwin-amd64"
      sha256 "66498c8bf617f24f2f9078c8967cbd1730f4dbafdf35efc8a10155d5f8083ab9"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.23/astonish-darwin-arm64"
      sha256 "16d3a615f6ad223b9c60520eb00371a0694177d3a53f0631374c2056baa44436"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.23/astonish-linux-amd64"
      sha256 "054b06a3995eb8a5b7a674748a364172f523593309b0e40acefde1093de2d122"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.23/astonish-linux-arm64"
      sha256 "5a39b4fd7435436be1b73bd633c12a6c33379841ca886927d97f1cdfe86daf18"
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
