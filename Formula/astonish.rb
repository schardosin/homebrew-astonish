# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.0.15"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.15/astonish-darwin-amd64"
      sha256 "7aaa6d9e06e938ce6edcef1e9edf34c5756fc2b3f3a85e5260181d0ccf585402"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.15/astonish-darwin-arm64"
      sha256 "cdaa9f64f2658686671a3b17035f5868dca1376f405933baaa24ea58ee511f88"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.15/astonish-linux-amd64"
      sha256 "64bc4ff352892f4279256d571b9fd1643565912f7bd9378fd182cc5bf1eda5d1"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.15/astonish-linux-arm64"
      sha256 "c61c928560fa7b132515733d4a8acff659615728e80c0dd59e38dec96413f0fd"
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
