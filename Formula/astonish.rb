# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.6.20"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.20/astonish-darwin-amd64"
      sha256 "b27a77068774d72db959771fa746a827ae5d538fce432872963137cce17a4d8a"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.20/astonish-darwin-arm64"
      sha256 "c5aa585768c56c68d630d455547dcd50451ba054b78a2fd7ee6de1425b8cf8c0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.20/astonish-linux-amd64"
      sha256 "661600d5073921b0d09eb8abbbe42ad3b8f5112888bd851ab9c237259f8effb0"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.20/astonish-linux-arm64"
      sha256 "ef70779eebc9980cd9b091993e52cb1ed9a8436e4c2119a9fc799b74e2f0b08e"
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
