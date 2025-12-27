# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.4.14"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.14/astonish-darwin-amd64"
      sha256 "a4e5599749a6699c42470498a0614576a1e11956a39c530bd4f13ab588083f11"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.14/astonish-darwin-arm64"
      sha256 "0151bf3676039d2e4ce137510ff8a9995b6849ec4d9c92f32ad35bc4b49c4e5a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.14/astonish-linux-amd64"
      sha256 "5a339d4938259edda54cfbc6e7311bfa1de0c559c21c3272a1c11bc85293ff1e"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.14/astonish-linux-arm64"
      sha256 "cf35ff3b80ac61ef0a0eb8c5e29aa66ed975be66a459495df099e3c7b8983e15"
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
