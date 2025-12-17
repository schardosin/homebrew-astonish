# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.2.7"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.7/astonish-darwin-amd64"
      sha256 "b3f04c5af80bf3155adf356b211ce5eba2d748097f024eb45bdacd623d334cb6"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.7/astonish-darwin-arm64"
      sha256 "701afd7f7ead4f79328487cd29b6969cd7febc0900cf6a0a94a1cd8871c49d51"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.7/astonish-linux-amd64"
      sha256 "84c94e16f17cec59d329c57b9736e8f208a60e59e2d32f037a0d5a81f9028432"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.7/astonish-linux-arm64"
      sha256 "bdb07cb9ffc98c91a56d14bc01b839e161cc06761b5703817f1ff4880cb71920"
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
