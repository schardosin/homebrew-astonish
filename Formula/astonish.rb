# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "3.0.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.1/astonish-darwin-amd64"
      sha256 "b14f5f0fb5032607d443c390c5cec8306ccb1eacf8438f43dbce4ff2ea82b5f5"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.1/astonish-darwin-arm64"
      sha256 "4c548419241926f215de48e07620db38dacb7bdf6b4dfea4e6502bf16ec3431e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.1/astonish-linux-amd64"
      sha256 "096118dbfc27bc963dbe716100b475c4e3ddef88a5f0c5dc053954462b7a6d6b"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.1/astonish-linux-arm64"
      sha256 "56a7be2c7234745825dd1e91512a4502056c9fc6da0990637f1dd19f0aedfec9"
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
