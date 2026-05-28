# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "3.0.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.2/astonish-darwin-amd64"
      sha256 "377f3e0c8fee0ec3071450393cf771d0d38b45c74fcc1a6c83dd7da5bc18c097"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.2/astonish-darwin-arm64"
      sha256 "0ca29cac4748d3b93a518343dcd6765f6459d8f62c4f6dcac46663355e0fe810"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.2/astonish-linux-amd64"
      sha256 "8f2fe7f452c86e73fef47db23010d791a1f82a9b74a2dc362bd46f976265d3aa"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.2/astonish-linux-arm64"
      sha256 "7ca499427660759e54589220d65d78f64d7a1547f1fdf3c5099405bc7f92e12f"
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
