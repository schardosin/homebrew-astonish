# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.2.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.3/astonish-darwin-amd64"
      sha256 "9a0381628c062aaccf1f4cbd46cdd4557eea535a4c7a1a50ecf77cf22b71d3a7"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.3/astonish-darwin-arm64"
      sha256 "55ae13917f3ff1ac3c23ef08fd6bbe00b82269b1b0c482f95c640f9b5764bc15"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.3/astonish-linux-amd64"
      sha256 "972ab04fb80056f6953169f06298bb0ba7c088b560309445f4f33c3a379b3c27"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.3/astonish-linux-arm64"
      sha256 "edfec094cf877ac7fd5778f73098ad9ddabc0fc64c4993289d0b5a95d85810be"
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
