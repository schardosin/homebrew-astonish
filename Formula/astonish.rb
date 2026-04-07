# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.6.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.1/astonish-darwin-amd64"
      sha256 "77296aaa4aa334b36826e6d0e937ef1d07f68bdd9ca419e177373e541f55eb38"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.1/astonish-darwin-arm64"
      sha256 "3f4be640499d21fadc8ca09c0c5fd11c6ca986481b26b0aea052aac3931e3e98"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.1/astonish-linux-amd64"
      sha256 "5c3f259bb91c6c568e97ee1f920a48723a01de8aa2235c6fc1295c80f369a6a5"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.1/astonish-linux-arm64"
      sha256 "ae97c99d1805a6fe9af128095bc8f3b5046efe6adf7193dc08a6a4ef4b055208"
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
