# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "3.0.13"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.13/astonish-darwin-amd64"
      sha256 "d3ac8065051cb5462f6a17de598b69b27f0f02c1a446da456f74b6eb6489ebed"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.13/astonish-darwin-arm64"
      sha256 "63023c0cf6e05460b4813b064635b9b3f2a59c924824cc5a9651a48a65c5561d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.13/astonish-linux-amd64"
      sha256 "a8f890e4166aab154c49fa1fa0c600b94945173f5bb7f387c605cbbdf9035668"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.13/astonish-linux-arm64"
      sha256 "3fc3125c343a0f518341e770977a9875e1efd4656331abf4a8e16efbbec87a96"
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
