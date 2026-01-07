# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.0/astonish-darwin-amd64"
      sha256 "64307c2f0a70956c8b8b310fec274e8f81e6f2c59f2a4cbcff764778db54a8e0"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.0/astonish-darwin-arm64"
      sha256 "0afff7ae3f39bf93691e938d4937b02a219ad096df081e8e4785d460e6744b56"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.0/astonish-linux-amd64"
      sha256 "cbee026bc707a59b3f7d71894fb67ebf7a3783575e5b7a48924efe0ffb524cb7"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.0/astonish-linux-arm64"
      sha256 "ed971f23ad206661d60763da110847f22e49d78cf667982f00790e6ba2f6ac5c"
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
