# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.5.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.3/astonish-darwin-amd64"
      sha256 "8497f592a6f53e090df54bbfaebd4bb245d0393ed066f0d15f7bbbb5f26d0d73"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.3/astonish-darwin-arm64"
      sha256 "43672cfa95b7226f64e529cf582889e10ed2c0f56e88e85b2204c04aff70d3e3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.3/astonish-linux-amd64"
      sha256 "2c14eb8d818e7a68c4dcbc0d929711c44b95afe97091b643bcef2acb43b0d642"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.3/astonish-linux-arm64"
      sha256 "f2d6f03b40fd097052aa310651c26af3408d8c905c2a47aa3bdca02b588f56ec"
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
