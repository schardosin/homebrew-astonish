# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.1.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.1.1/astonish-darwin-amd64"
      sha256 "0ec1b97ec8f20899e67ec9cef7bc067c174a77350f959c505bf992db93a7487a"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.1.1/astonish-darwin-arm64"
      sha256 "ac96873eed9ba91adddf40b7fd61731609074bec2b1b787bfea9f03a91a232bf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.1.1/astonish-linux-amd64"
      sha256 "af686092699c214cb7624c563d7d6ecbc02095f52cd5ddbe6e02d3a6be07d9e1"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.1.1/astonish-linux-arm64"
      sha256 "95af02ee6970edcc58ac54f866cbca4ad380fa30c38a3a09698be186603b03cb"
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
