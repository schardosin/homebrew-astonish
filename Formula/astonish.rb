# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.4.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.4.0/astonish-darwin-amd64"
      sha256 "432798f5f0ab28cd2b1c764fc50a06387296a884ad4d771477a4388a9d445fe1"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.4.0/astonish-darwin-arm64"
      sha256 "658f11a705bcc1e14ca70655d694cd82be23719c995adc41d8a705f8b0f33c20"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.4.0/astonish-linux-amd64"
      sha256 "c73e9995988d356768071642cac28b127eea76012af9f6495a796f0d7c252b11"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.4.0/astonish-linux-arm64"
      sha256 "dd4f8cf7333b093b9897020e95fb4b3949f1fd3950aa9d0220a1575989cfa874"
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
