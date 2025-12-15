# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.1.0/astonish-darwin-amd64"
      sha256 "989cc2e28840d80c7616a2110ca427e51ee51ce3cac2a8d20e689cc84b61f68b"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.1.0/astonish-darwin-arm64"
      sha256 "2a4076f0e33a899554cb36aeda12a417070a69c1ce001b544461a7bf6ab928a5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.1.0/astonish-linux-amd64"
      sha256 "3055642069e0f7f8bc96dc93f6967c08b24e6e5b772a10a2d854c35a8d136806"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.1.0/astonish-linux-arm64"
      sha256 "da0370588e2490dfb23068feb5ad7b6b00e97838b915fe4d645d0c7ce5f9ab25"
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
