# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.4.16"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.16/astonish-darwin-amd64"
      sha256 "fc541b688c96e5a210a2dc2de66e660ddae1c361f846b64d338ea8afadd9fc74"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.16/astonish-darwin-arm64"
      sha256 "6e7b3b97a401b223645abd0cd4af1beea344f5887dd384f10a4661b83862fe42"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.16/astonish-linux-amd64"
      sha256 "9dcb79b92dcbf23c8dc1b9cda8d56b25bc9e13fa1b8e8b481529ed8e5fee010b"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.16/astonish-linux-arm64"
      sha256 "6de0cebec89edec8149ef4c6437aa43285f782226e4427c5e49ca3234850a822"
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
