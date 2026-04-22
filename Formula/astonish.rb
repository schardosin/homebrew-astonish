# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.9.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.9.0/astonish-darwin-amd64"
      sha256 "b7606adc9793ec0651c6efee8a05f909278e3492d5516830df82a93026743f53"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.9.0/astonish-darwin-arm64"
      sha256 "47daa9eba13e93d59b7bfcf85440565a950281b83942f41a73c11bfb9a6feea6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.9.0/astonish-linux-amd64"
      sha256 "6fe183ef07600aeab20fc064fa336ccde5b2a54aedaa317ade8c3f51c08aff6d"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.9.0/astonish-linux-arm64"
      sha256 "4b4f6bae8cfd5ea2cb44523f833e517ab6cd3655a337ac3ec611abc6ca101bc6"
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
