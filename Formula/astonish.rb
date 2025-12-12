# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.0.14"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.14/astonish-darwin-amd64"
      sha256 "bbe73082b299635f8087b7182398a6ab1283bdafbed4aabc8ae210505da8f68d"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.14/astonish-darwin-arm64"
      sha256 "5854e4522bcf760ea85e8000a99c3f6617248abc465fe0f7a2fa7f175b413ba7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.14/astonish-linux-amd64"
      sha256 "4bd348be7aad9d6588889c0c46e21afb206983207b4c6e2e2c45016fb3f90a2a"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.14/astonish-linux-arm64"
      sha256 "923dae7724834373f35ca4865660b01ac29debb330bafbd31ad1eddfc9bb0e94"
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
