# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.4.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.5/astonish-darwin-amd64"
      sha256 "94421ff7c53a8a79fc6f2e8f86559d19f7e8af3e8d2fe2d317c810d07e68e405"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.5/astonish-darwin-arm64"
      sha256 "3f9ef015b17b48a8b24d959e73ae86002bc40612398f91dfb5f7d61ee007c3c5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.5/astonish-linux-amd64"
      sha256 "f260a41fee95b68d115f289b4cb3dc4a3bb930c6b006dbe5b7b055942f36d04a"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.5/astonish-linux-arm64"
      sha256 "2c2b78b684727263c79fe67a253e911fcd40fa6878f5c08b4e1604263be16317"
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
