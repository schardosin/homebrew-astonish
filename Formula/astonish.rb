# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.4.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.2/astonish-darwin-amd64"
      sha256 "38a762b60084430ceb4106d8aa368d784640bc3994134e1ca6a15da1866a7e67"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.2/astonish-darwin-arm64"
      sha256 "2788d12c1a852780489a5bd55656495c87722e01709be8a2013cca8c98239899"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.2/astonish-linux-amd64"
      sha256 "970481264e5f3abdfaeb96948698dec25d7cd1ebe60d3008bc56092e12998f16"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.2/astonish-linux-arm64"
      sha256 "c5ef7ee90c5190885575f9973444a773a82bf0643f8fadbc9d858d27e0546129"
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
