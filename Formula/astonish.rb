# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.2.8"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.8/astonish-darwin-amd64"
      sha256 "9a6789fdbf5c87e66bbdc2262e4bc368ae79b54c315d7579fe26eadea7aa5b1a"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.8/astonish-darwin-arm64"
      sha256 "1a4e17eaf1942b02d0adf8255b8934e6870c77125a8622d76da2adc59b0ee392"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.8/astonish-linux-amd64"
      sha256 "356ea3903ecf1067a664a6658fe1da7f9e4384f723e0cab808730fe2c375bb13"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.8/astonish-linux-arm64"
      sha256 "2af64aeaca135780d5bd053d18540b7f48dcbca7470e90c4949959279093a7b0"
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
