# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.5.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.3/astonish-darwin-amd64"
      sha256 "78d32a3d1af2b3cf68886ce680940a3ec306cd7bd4893b6b9b987f29653e6f8f"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.3/astonish-darwin-arm64"
      sha256 "1091a5e1d2a9e00f78ff59a97ff0476ed78b20771bef430db8cf5c7e85e4f0cd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.3/astonish-linux-amd64"
      sha256 "f84a083464e732e5706349626ccd5c4d3a59911387057c284079e2024fb07671"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.3/astonish-linux-arm64"
      sha256 "cd1a66587626883ccbda4f96bb2ef99164a737f6b33436431a0f4c277eea7245"
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
