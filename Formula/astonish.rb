# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.6.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.1/astonish-darwin-amd64"
      sha256 "a17d9b6c3179de9e98aeb8f221f1b27bdcecfe530d7bb53a7a92c40ea46e8590"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.1/astonish-darwin-arm64"
      sha256 "f42472e6c1697e8d23ba8cc6cbe455c61cc266ebf0c61119057bfd4d294506e1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.1/astonish-linux-amd64"
      sha256 "05e2b10b260113b4ea593f1f3ab2b6d4222aa6404d80d58fde412eb5d6342dfc"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.1/astonish-linux-arm64"
      sha256 "e1e250c202b8a53a1a9bd77cc340944a95e0bbfadfb4990eb6fe172d4249aeff"
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
