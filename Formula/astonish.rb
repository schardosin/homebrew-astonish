# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.6.14"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.14/astonish-darwin-amd64"
      sha256 "dc5fed317387935e37bb68f2834f828d5b4c312763848e90459928d9d1d029c8"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.14/astonish-darwin-arm64"
      sha256 "dc1c08a593bd7dfcbfec092b7af9ce247664fb875528eb3bd37608afc3c78fa2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.14/astonish-linux-amd64"
      sha256 "23e1bf1545f0ee7767b1708bf3b2b7aaa9bac2eae4a1f25286fa1a5fecfb3c35"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.14/astonish-linux-arm64"
      sha256 "42cd6852f8858a2d3438c27cde85e34ab4cc1f89854de0efe171bacfe8ac7404"
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
