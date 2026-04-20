# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.8.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.8.0/astonish-darwin-amd64"
      sha256 "545c2c52d45403e6d4072077498166906edf0600b73dabfd7f5c5015f505ba5c"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.8.0/astonish-darwin-arm64"
      sha256 "173fe6ea4598319fc96d40f74a1ee96fa7cb8567ba127ce609dd29f933aba287"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.8.0/astonish-linux-amd64"
      sha256 "68d4e80f7556c66eae6363290bc53eb014648f84305d9cb5882ae6786165aa1e"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.8.0/astonish-linux-arm64"
      sha256 "d9b0f7216c2deb25467c62950f3f60ffe2d9c6f2e51ed68705b4425224b9b6ce"
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
