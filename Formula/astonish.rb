# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.6.15"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.15/astonish-darwin-amd64"
      sha256 "d2dd120093b218d1cdacab5ec627c8c44479d84e74e22cdda5b894ddffc6ee62"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.15/astonish-darwin-arm64"
      sha256 "35d741e45d7ca271b669993418a505a3aa84c01a3df985d744fdc5bbdb0d0285"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.15/astonish-linux-amd64"
      sha256 "62a3bab3c349d9de6beea81ed83fee10bc27fbb42876b59bd38a2470ae58d09b"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.15/astonish-linux-arm64"
      sha256 "249d172b58d2c87bbaf8bd7aa68dcc31aafd6dfcb520c0375b6fc0d985fcbc63"
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
