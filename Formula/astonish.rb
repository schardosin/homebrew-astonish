# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "3.0.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.5/astonish-darwin-amd64"
      sha256 "79bc027ec4d4fb536fba43e35fe65d53921963df32c188e40dacd7747fbc7e5c"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.5/astonish-darwin-arm64"
      sha256 "a479446cccf8db5b255babfc30f5bc88d34d494b1961600cf96c80c62f315798"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.5/astonish-linux-amd64"
      sha256 "33d1cb6dc3b3adb7058fd80223239a1887084a40f3e2aa560d50b60dd6d3b3df"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.5/astonish-linux-arm64"
      sha256 "88af46bb0cf309ba7e472319b2896a7b9fad0bb4782fbfa767aef762131e8ac8"
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
