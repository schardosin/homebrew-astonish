# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "3.0.6"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.6/astonish-darwin-amd64"
      sha256 "fd15ff3121441430974bfbc8fbd7a414278076514f49e4334aa9e152a070cf91"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.6/astonish-darwin-arm64"
      sha256 "d3fcca923bc42f2046c75807e28e797c18e7ae5b7ec9a41caac71626c15ca789"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.6/astonish-linux-amd64"
      sha256 "5c0c42736f2dd5c9839f8cfa817d651d92e4b0b4b2e97ef3008090c9ab9901e8"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.6/astonish-linux-arm64"
      sha256 "76f666fcafbf90348d273bf65c7aa333e633d6e7030480794e519a26f649bc85"
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
