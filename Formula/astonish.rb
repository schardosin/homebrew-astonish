# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.5.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.2/astonish-darwin-amd64"
      sha256 "63a02a3d9bfc4a9afb098c8f60ccded7bcb05e1def95ab7f12ba4688c2571de4"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.2/astonish-darwin-arm64"
      sha256 "1bef5c04033d54eb00fa2684b6d35edbac6af377df9dd2a87a6b2e62077d2e0e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.2/astonish-linux-amd64"
      sha256 "0e8fa11ba1ea1ecb01112e8d23658835bf56a9d14179609563d2df5413c28b64"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.2/astonish-linux-arm64"
      sha256 "ccc899740f9747fcfc8ffd817a53db18489140f9281da492bc49eb1a63adabeb"
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
