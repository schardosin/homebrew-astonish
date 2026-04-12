# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.6.8"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.8/astonish-darwin-amd64"
      sha256 "899a5267503dc25d09a823d1114b43b7ef49ad498446565f9cbec34d0a2999cc"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.8/astonish-darwin-arm64"
      sha256 "f118e03ae01fd084350243b2e972a1066772015cf723492b7e8fcd685f410903"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.8/astonish-linux-amd64"
      sha256 "409ef1ce352dac192a627009327bd1875d799446577ec01a45bc734d85713761"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.8/astonish-linux-arm64"
      sha256 "aec7a026d731e3dc5ea5aed5531a82ec0395ccb88aabd6480dbf282819cf895d"
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
