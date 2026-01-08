# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.6.9"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.9/astonish-darwin-amd64"
      sha256 "f155e2c32e6878afe2753cf35058c3d46f3a52c0a5a6d9c2ec5fba7dcbc9671c"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.9/astonish-darwin-arm64"
      sha256 "85d46d8888b3b812e7010fee339ff118deef175caf359352549dd94d3820af0d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.9/astonish-linux-amd64"
      sha256 "a6f4fa21fe0e5203c2b5df24fd8c7d4d176f1406fab937ab6a350b296e6beea5"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.9/astonish-linux-arm64"
      sha256 "46dc841e9c3fd912f23ca575fcb3da1210099278798ea13c69f3af05416817e8"
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
