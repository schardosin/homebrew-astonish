# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.2.0/astonish-darwin-amd64"
      sha256 "c27331d8957665b2f096bbffd5d4f94965413ab1330f2695888eb5d59e769e1b"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.2.0/astonish-darwin-arm64"
      sha256 "54b1bd9af3504e92d526b9c4f9573d531ffa29162e2a79e2c7702a4887eec8c8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.2.0/astonish-linux-amd64"
      sha256 "392ba92391613c7decf8395a2bde9f97531bd48ec213426c9b78182acea39696"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.2.0/astonish-linux-arm64"
      sha256 "554755b442327021426b4499d44276c5400e7b7c7bffe08ee0fc3cb0f326886e"
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
