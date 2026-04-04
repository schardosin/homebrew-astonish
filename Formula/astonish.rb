# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.5.10"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.10/astonish-darwin-amd64"
      sha256 "5c7509cc4fc2cc1d732dd7e1e83bba1346687c9499dcdcd387fb3a575a57661b"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.10/astonish-darwin-arm64"
      sha256 "67d74175622f37028dcfe1572e05bcc715e9b60a40da888a9702be9f5d7116ae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.10/astonish-linux-amd64"
      sha256 "933757bc267b374b04c039d39773e17e2c030faf1c91cd6e5c05a5fd92796995"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.10/astonish-linux-arm64"
      sha256 "a84ff5288cdda3b4c299c6e9fb4e4e4668c5848962a3daf4646583ef8baf97dd"
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
