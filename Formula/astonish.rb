# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "3.1.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.1.1/astonish-darwin-amd64"
      sha256 "aab3670acf2896627bb55043000f897024382b97319f20934ae092a1601d3d7e"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.1.1/astonish-darwin-arm64"
      sha256 "929bdcde6522e73e9fe2492e5cc6a0b1de0e8601095c5f9f87a1094ad9872cf8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.1.1/astonish-linux-amd64"
      sha256 "ce90e8ff4dd4456d501962fe58814d7e3c8086934d8831b23ab039507e22e8e3"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.1.1/astonish-linux-arm64"
      sha256 "6dd1cd3b18bc63228f804f51364b8b0ff042378d516be253c11b42f48b531e4e"
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
