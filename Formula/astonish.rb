# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.0.11"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.11/astonish-darwin-amd64"
      sha256 "6ada4427e859bc33bb5b9802b371ceaa06d4b5958a55a16227abeaeaa40b1fad"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.11/astonish-darwin-arm64"
      sha256 "098de04f3e7623771b64ea7387dd821b6ec37c774d586a8e1d090eedf3d72abd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.11/astonish-linux-amd64"
      sha256 "20bc6eeb5837c543b30f5eabc565db0b89059b41df569aa1d4266ee94fc7c33c"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.11/astonish-linux-arm64"
      sha256 "c789a3243ef6efe9f73e2dcb62dfa95e031c8e2988f50a783c684d5fbe451078"
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
