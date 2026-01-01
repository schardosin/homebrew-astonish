# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.5.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.4/astonish-darwin-amd64"
      sha256 "d2d1a18ecc70a3c7d398aa21f6397b0705ad24f1517bef9fd8bc8ccea31a35c2"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.4/astonish-darwin-arm64"
      sha256 "b7426b3b722d55327828295353f3e5d102b938b9c58969ecf09c61ac44a70995"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.4/astonish-linux-amd64"
      sha256 "5f9d99ef35da3ee757c7c87f41ae0bd9a303182e2cf1de0016ab719c53401cb6"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.4/astonish-linux-arm64"
      sha256 "aa5ef6f5294d2f4815f1523e38ad4631587c79507b77afe9ff29f557fd3f46e1"
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
