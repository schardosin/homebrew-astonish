# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.5.13"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.13/astonish-darwin-amd64"
      sha256 "a4dc40130c25725a6ff1f2be7d7aa2ad0fc04773293e6f06b1cc10b45b6c49fb"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.13/astonish-darwin-arm64"
      sha256 "2ba9b071d841b00da94ad6ef4b8f5d1f57f89f524a2caaca9737f2d8ef0e9c54"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.13/astonish-linux-amd64"
      sha256 "9d18524f181b17f17a2a6d4fb9c0b3b59a8c1209eb60b8afa5f15b9efb08a63f"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.13/astonish-linux-arm64"
      sha256 "b1aac50fd9b6295014fe39455d21a01ff9e8be80709573c9c4c0e269d65b7d0f"
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
