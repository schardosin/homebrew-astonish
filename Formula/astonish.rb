# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.4.8"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.8/astonish-darwin-amd64"
      sha256 "a1ab27d47bbe479ded70e38ab3f69ae257c36425dff66a5595ed01437f2f9e00"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.8/astonish-darwin-arm64"
      sha256 "b89db4dd5bafaf7b70e10776f227d35a890971658f2accdca3f0ede719590e17"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.8/astonish-linux-amd64"
      sha256 "d1392a7743f25d5775e8951c93a119059cb40732299f3e5d45f64dc31e4fe04d"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.8/astonish-linux-arm64"
      sha256 "890568fd8b99e212436f75486808c83aa874221c3c8ac7919ff8e6fa46ed8fd6"
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
