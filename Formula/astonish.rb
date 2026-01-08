# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.6.18"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.18/astonish-darwin-amd64"
      sha256 "2189e83063ab9284308a499089abecb7f7d57abcd781b58a29afec05320dc4ac"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.18/astonish-darwin-arm64"
      sha256 "f096a52a688495bbc79593358e8623af6fa776b8d5cd70930ef8de7275d967fc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.18/astonish-linux-amd64"
      sha256 "1933620b83e8c94a6e16e5089b8f82fa63a6910c5b25dd6b25d30b9cf61e68cd"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.18/astonish-linux-arm64"
      sha256 "ac57e4e5fa78c84f7f1dd01cbb70230ef20103788de94b4b4bb1143310ab6ce6"
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
