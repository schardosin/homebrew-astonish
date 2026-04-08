# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.6.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.5/astonish-darwin-amd64"
      sha256 "33ac8464c33e7f8de2e155f39e0b4265bc5753a5c9970b589dfb264eb9e8474b"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.5/astonish-darwin-arm64"
      sha256 "e65e81dedd76da8a3e8ae26ae53c9d0ec348251c20784fceec8dcd77898773d8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.5/astonish-linux-amd64"
      sha256 "bc7a528ab5361f2421b514d32d092445b19da453b7ee78db8884b9b6c54b695f"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.5/astonish-linux-arm64"
      sha256 "48af6f325908963ab16d909cb3980353c7b27e2c0b3f28e0d72236761cf29b10"
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
