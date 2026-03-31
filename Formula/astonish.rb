# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.5.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.4/astonish-darwin-amd64"
      sha256 "d47f6867bb4cf03025a6804412e612caee865ea87f04482b57d543f85d14adc4"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.4/astonish-darwin-arm64"
      sha256 "24d9e0317f8e4a3c87d21bf7b68383be54bcf4a30c85d3754f582759b1d3e6f0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.4/astonish-linux-amd64"
      sha256 "993f1326020b08ec235766cee6de21d692d1c4e780c8400b22e50f12849a5523"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.4/astonish-linux-arm64"
      sha256 "3a90d0898eaf64a28a26954e3eb47903499909f554b337f0a5dcd0483c7d457d"
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
