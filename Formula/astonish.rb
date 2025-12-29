# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.5.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.1/astonish-darwin-amd64"
      sha256 "476495d1f2f87f00a2fcc4c85ddf49b02b7ddcb990fc8748e08dfecd9fc70b66"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.1/astonish-darwin-arm64"
      sha256 "dc5e1a0242ce141d8b8261258163dab294c6e6c54f7fef9dabe6602e95974ed2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.1/astonish-linux-amd64"
      sha256 "862957e4ff5af5453823a1a47cf81d305f44e5d3c769f0648cf87cab824ae2f2"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.1/astonish-linux-arm64"
      sha256 "8582c0fe516e2f6b6803506914bb33c76ad1fcd4844215872c32113d8f63cc67"
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
