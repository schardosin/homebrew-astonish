# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.6.7"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.7/astonish-darwin-amd64"
      sha256 "ac57fce45f6dfd56ee72d450987266f469550085084a92da7524ddacfcc01781"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.7/astonish-darwin-arm64"
      sha256 "b34c01dfd9372e2c90d8c16d906a59252b6edcb2d7359be0a17c37242f21e2a2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.7/astonish-linux-amd64"
      sha256 "c79211ab2b8e4393140b415acf249ad68a6643369856e24eb1d21818a14b0494"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.7/astonish-linux-arm64"
      sha256 "92f4e8746e906cea5cd866db178ee69d86dcfe7c2785679ce4607f2cf2354548"
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
