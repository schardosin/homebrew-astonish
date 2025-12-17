# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.0/astonish-darwin-amd64"
      sha256 "2554364ec553fd6dc16da75dc785e20ff03fa903b39e3dddbb47fba459c8fbb3"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.0/astonish-darwin-arm64"
      sha256 "2298ba2334f64f9715893fa17c25c3de857fc94feba07cb8ea049da614f4e222"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.0/astonish-linux-amd64"
      sha256 "87d59961f7004e59d0d86d062c4dac352d54ae6252a558df2969a7384ee79938"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.0/astonish-linux-arm64"
      sha256 "bbb05dcb816904483f93cc5db9f5bbc1f3a6f6292dac92d437625f51714041ef"
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
