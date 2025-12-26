# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.4.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.3/astonish-darwin-amd64"
      sha256 "a1549337bbf8fcb389a8f988534d561689baddb546dffb3281a6c8c694d4c50a"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.3/astonish-darwin-arm64"
      sha256 "a97a9c72481a845881407d0e91718856688bfe622115894b1206169f77b0d316"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.3/astonish-linux-amd64"
      sha256 "ca4165f1d0e3a047152d82a04ef2db86b263b515039865d1d7704b8793801d5b"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.3/astonish-linux-arm64"
      sha256 "152af7a5db354a724bf946d7879e6680522641c76103c211ab3f454ece6ce00e"
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
