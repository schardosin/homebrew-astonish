# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.5.11"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.11/astonish-darwin-amd64"
      sha256 "e2ba1ac576d86381e1c73f7ae06c0cd92f247957fad19ae324580ba030f2ba44"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.11/astonish-darwin-arm64"
      sha256 "b58cbcbeac9a21b734bc05b3c2706b0b262975355916c832aa8c7ee0fcfb2949"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.11/astonish-linux-amd64"
      sha256 "10de39facc9448da75929e72cc963e5323be25a01a725072c119ce0ccff299b4"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.11/astonish-linux-arm64"
      sha256 "c10b3098d1931c050454cd2dcd5fd8a407f9406c30ed639401703ef793ad3f1f"
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
