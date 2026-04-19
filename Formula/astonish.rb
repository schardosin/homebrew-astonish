# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.7.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.7.2/astonish-darwin-amd64"
      sha256 "d66e8bf7346a098fa310b4a830db2a46a5de37def850ad05c8c69fc27722b7c0"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.7.2/astonish-darwin-arm64"
      sha256 "c706dbbd83218a2668bee0e8af253ecfd7d96e56750f8dd7aea5fb5472a0f0a4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.7.2/astonish-linux-amd64"
      sha256 "1889aec07fb85251db0327dd5aa2c4a41d0cfea561a601a27a3d5d13c38047d7"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.7.2/astonish-linux-arm64"
      sha256 "f6e59d2f5567dadde6efb00a66e6559ec555e95fae740b3735933e66190b2faa"
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
