# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.6.17"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.17/astonish-darwin-amd64"
      sha256 "d6f70dfce38ea2f9adc01aa9c32a86e12063cae850c42c91fd9f8adde0854ed4"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.17/astonish-darwin-arm64"
      sha256 "1ae1be58242aadf0353382d042a59a2e084c7b1885231033c23b4a5daa71feee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.17/astonish-linux-amd64"
      sha256 "416c2f21a1b71560a35e010ef96f3c84cef65add4a3ed665064955807770d5f5"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.17/astonish-linux-arm64"
      sha256 "bbc2362941a63ada72a98a5b91eac9c4c3bdd28d2c334ee40ace1d882ade47fa"
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
