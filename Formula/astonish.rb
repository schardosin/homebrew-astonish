# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.5.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.5/astonish-darwin-amd64"
      sha256 "5644af60baeb0824c51e65bcc3359fb9eeaebc58901e9d8e5e568328764a6452"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.5/astonish-darwin-arm64"
      sha256 "494f1dd09f2a149481e892ccee0f63f6ef913f2996b3d5b7d062a1bc92616d2a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.5/astonish-linux-amd64"
      sha256 "dba4b4d4bf52f4f44781a2da8c71aae15a727a57e416247ec93cd1077c8e1805"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.5/astonish-linux-arm64"
      sha256 "3cc53b3b2569d9364da0a2f806bda2e03d26188c0baefaaa690f40f8aa21d07c"
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
