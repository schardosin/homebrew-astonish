# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.0.12"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.12/astonish-darwin-amd64"
      sha256 "ce0cb2e64bbb3deab47d854872add8c9e1098cc5f81700c8c590b237f79f728c"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.12/astonish-darwin-arm64"
      sha256 "0cc0513e0b3782e1852c8866290c374059072528ff58290062a3cdc0a683c84b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.12/astonish-linux-amd64"
      sha256 "8b9c75deaa434bdba451a8813729595cbb99cea5b257d7dd234da0e0099503ac"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.12/astonish-linux-arm64"
      sha256 "b3cb2c1b2ec48978c3f6a28fb7047dad217f3a9dd032e22a708448b41085a639"
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
