# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.5.8"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.8/astonish-darwin-amd64"
      sha256 "c50da8b266b4ff0d785425030339c7b6136dc8ebebea66cd5ec928aff7b3a5f3"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.8/astonish-darwin-arm64"
      sha256 "8ad3183f856cf9d298e96a03cdf3354e23c129346026e0acce5b815c57488e12"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.8/astonish-linux-amd64"
      sha256 "12626ba678fd87795adcbb54f3aac3bf6ea56c95cbf860223728b2e8a7f2ab16"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.8/astonish-linux-arm64"
      sha256 "102678c849d20204aaf941e734a99739132c807812400da3b45785dc590d512d"
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
