# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "3.0.9"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.9/astonish-darwin-amd64"
      sha256 "4d9d86265e4f4c5c6e930efb7b20f0ed1188f08d1163727e897d31fc391bb060"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.9/astonish-darwin-arm64"
      sha256 "a386dabbb7acf5e5d2bf8bbd0190d1af96105bb3fcd69a142d151a029dd506b6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.9/astonish-linux-amd64"
      sha256 "4fcce8a278009063467cc47abfc9833cb594e43ed81856dcfab860ca4f1ed5d9"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.9/astonish-linux-arm64"
      sha256 "c6512d2a044a16a7fc214a8d55a788f154556488155cc77d75e0bba1a84a2209"
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
