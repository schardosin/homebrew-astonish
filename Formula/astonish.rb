# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.5.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.1/astonish-darwin-amd64"
      sha256 "c8f98175a73315c8ddace5c45d8e9b75244b78f92d13cabf2cc338f9cd2bd4ef"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.1/astonish-darwin-arm64"
      sha256 "244fde1bb6fe3be64e35c7029bab653091eddae19a48f6f47fb0ac087c832b03"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.1/astonish-linux-amd64"
      sha256 "0d062ef0d1254f2522f457dab273bd34e96bb6a32fda808da479bb13fa635c26"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.1/astonish-linux-arm64"
      sha256 "213e5f4e23c7c1bd02e4eb642f43a8b65e5b7695b80c4a79be5f9fd485aefed6"
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
