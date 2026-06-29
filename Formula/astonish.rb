# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "3.0.22"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.22/astonish-darwin-amd64"
      sha256 "8cfb3efe96943daa05fb9d9d4029c545a8cd5d6de733dc448898749303747901"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.22/astonish-darwin-arm64"
      sha256 "7f87d8ff126a185b589b5bb09093d4184824a8d6e475b1d51960686ac2530ef2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.22/astonish-linux-amd64"
      sha256 "f04f795e44fb0543c9e0017c366cf6a4bcec02fa287815455993a8132df81a97"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.22/astonish-linux-arm64"
      sha256 "e515822a21cd9acb35abe1f5f4b5d8d6d0e714208232ae25ab9e215feeee3789"
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
