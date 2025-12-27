# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.4.13"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.13/astonish-darwin-amd64"
      sha256 "a050f7134c865a41457cce6646611a1e065383a81943c7c0dc36391bfe766fc9"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.13/astonish-darwin-arm64"
      sha256 "27867c6807173ebeacdf98747089aa1a662d694dbc2ccccde0444e460bad056e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.13/astonish-linux-amd64"
      sha256 "a82221b140b17fa67f25b3c1f0b329876e69c0de90254da2fc1c5f99c11e07d6"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.13/astonish-linux-arm64"
      sha256 "6a1ad592c878d021949e16b1906e81b68fdd18f7e2a8e8bb8f7ea531ec7dde8e"
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
