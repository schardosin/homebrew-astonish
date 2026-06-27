# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "3.0.21"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.21/astonish-darwin-amd64"
      sha256 "1c0f627936b2da9bc9efe92ec8ce67c227f3946d8e1f98e3fd4a7c3958200f63"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.21/astonish-darwin-arm64"
      sha256 "9283b3a84afb39488fdcf4b793fffb05e92d7f1bbc5b95948258d85a36dd2006"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.21/astonish-linux-amd64"
      sha256 "17a0df01e12d05267874bcdcc82250a3ed4f1691a36d679c16dca656a373268e"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.21/astonish-linux-arm64"
      sha256 "76749744b3ea3059aa1a544eb46538c7f53e3fb86c1ebe654278153f50618ac5"
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
