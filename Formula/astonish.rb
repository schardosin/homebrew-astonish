# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.2.9"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.9/astonish-darwin-amd64"
      sha256 "f474eda22590c8e2d0d6ef0260e4c1eb3ee1aa7ea377752d1f77b26a8807155e"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.9/astonish-darwin-arm64"
      sha256 "f203ea0d48ce0feb24fb2e920d468f6ec1b8f056b82a1d14323b31119913c561"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.9/astonish-linux-amd64"
      sha256 "bb7ada8c7fff5c53141a3774f96befc9a35492eea45a60f55fcb1797a134a3c0"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.9/astonish-linux-arm64"
      sha256 "381c25b7a00816c7c39d2f9af85bae032e9a137449c75b9056e0ed1c95682a0a"
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
