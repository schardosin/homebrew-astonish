# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.6.12"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.12/astonish-darwin-amd64"
      sha256 "25af1709b483bea9ff46ac39580ce01088f5a9ea3dab41d6fab376d3c88a6dc8"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.12/astonish-darwin-arm64"
      sha256 "4f5bc2fc44884aa383faa6f5a8e2be9ac4a8870eca8fa6427cbfb4d48534dce3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.12/astonish-linux-amd64"
      sha256 "38be0721a5c8322d7e7dfc012f24ef89e8b3ec4e5fa5dab56615c8a44e43bc7e"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.12/astonish-linux-arm64"
      sha256 "139d7699f026024dc467f218eb06b1f438ca60470c583be9385493c17e5bc7d9"
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
