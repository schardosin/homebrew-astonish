# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.6.11"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.11/astonish-darwin-amd64"
      sha256 "6fe9846458b2134020a8bc5604e7854c9ba2e94341e3f207d6202422f0e15449"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.11/astonish-darwin-arm64"
      sha256 "94b2334e7b8fa169f6026d50cc23f315989bb0653641d3577d20f203335dafb7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.11/astonish-linux-amd64"
      sha256 "bcafe4f2544d90208a5bca0b5ea96910b4afea5616c5983e1f97a886a9fa297e"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.11/astonish-linux-arm64"
      sha256 "ee8375b69d620870dada7d88170ffd28e2678bedcc377b32537dcb05b1f6c327"
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
