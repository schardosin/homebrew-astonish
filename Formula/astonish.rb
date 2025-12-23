# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.3.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.3.2/astonish-darwin-amd64"
      sha256 "4230ae22382a944a4c9ad97209bc0151c6bbf19422d3635f683df419367ab0a8"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.3.2/astonish-darwin-arm64"
      sha256 "31669901dc8b73cef54a5c6bba8d7404d27e61eaeef77eaaa8b464b06f4012fa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.3.2/astonish-linux-amd64"
      sha256 "0725590de7a61a318ba01028aba12a286f9a9f415894ff3791950f933ad4d04a"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.3.2/astonish-linux-arm64"
      sha256 "f729830e9a6467f35165a50bfb5d4294be98fda4296ee205a50c7e95937ed14b"
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
