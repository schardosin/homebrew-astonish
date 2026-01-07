# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.6.6"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.6/astonish-darwin-amd64"
      sha256 "aea707f89cf40470ef17419866b9499c0407ac2d4c18e1809e7246688d4f11fd"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.6/astonish-darwin-arm64"
      sha256 "bdf3056a3d6a0c6054a911112c9ab9e100c4b1566f71351b5a73a845547b9fb1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.6/astonish-linux-amd64"
      sha256 "9470a0aa3a55f1eb94a26f9e32f7efb2231472d0d37b4e4a59108ccaa43e92d3"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.6/astonish-linux-arm64"
      sha256 "5d311a8598e4fccdae7acbc0c0b98e5952fa7ff05f6fac7c4ed2a4ad9db1fe36"
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
