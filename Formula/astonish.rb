# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.6.16"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.16/astonish-darwin-amd64"
      sha256 "572d8c35d48f37acdfd4ae06c0912217fe7a55d966d5061e39281edcd0e952e7"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.16/astonish-darwin-arm64"
      sha256 "17a705cc40181a4b484e66e90f34e1aac7077e33292216b1e6f8cb2f879e7c91"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.16/astonish-linux-amd64"
      sha256 "c2224fd7a257b943fc8571bd819af5018471809b56d5d07640c7fae1ef70aa16"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.16/astonish-linux-arm64"
      sha256 "3128cdaeb1bce6cfa8a6f76fb25fc45ba7f1f3596616e6dfd19d715efb58abb6"
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
