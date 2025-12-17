# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.2.6"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.6/astonish-darwin-amd64"
      sha256 "f6be7bc912a80517bf226067947901c83a8d3b7ea0823a6e93482e5621ad835c"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.6/astonish-darwin-arm64"
      sha256 "857347dacb5b0520f1aa81ee855bbdbd47ac09205b54d5d96a89c7eed824bf45"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.6/astonish-linux-amd64"
      sha256 "7ff4d7d11389995e61002d3935ac6df7b4257038a5cf41d3dfed5a9c6cf310b9"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.6/astonish-linux-arm64"
      sha256 "c38377e37535c70756f8dc5c3d4a3904b9d0f10214776331ca8070fe29a88418"
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
