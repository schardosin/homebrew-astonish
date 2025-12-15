# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.1.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.1.4/astonish-darwin-amd64"
      sha256 "3fa98dd6d2f9739e35e770c9171e1f43cdf56a97d3d6d7d0219bd4b3e2b258d7"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.1.4/astonish-darwin-arm64"
      sha256 "4007d4aedd14cc38efef96018174a5836c6c3a40cc3536a06ae6fa905875c014"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.1.4/astonish-linux-amd64"
      sha256 "d8cf462d8c0daf789c8fa242ffb5c747f211c158cc01c7cc7837d8bf037f3375"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.1.4/astonish-linux-arm64"
      sha256 "1dc99cda717fabd2dbb259b07eabd39373e693346329ab0eed1a2f3b0a073f9c"
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
