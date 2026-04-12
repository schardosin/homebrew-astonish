# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.6.9"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.9/astonish-darwin-amd64"
      sha256 "c3f3b913f97d14c83468bd4588b4772d4d6ecda8666c49871c24ca5d622b1303"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.9/astonish-darwin-arm64"
      sha256 "123d0df0c9fc33d5b4cb43f8a65fe36d565179d34921cd2a035d2a7fffcff4aa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.9/astonish-linux-amd64"
      sha256 "98f91920b32012ecb662d773e0e0c1a83210a077c226e19091d1d2d9a74dfa35"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.9/astonish-linux-arm64"
      sha256 "23784f3f81d268d1719d55a6f7e717750f41edb58d01ae5815c9b84975d35f52"
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
