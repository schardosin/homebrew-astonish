# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.0.8"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.8/astonish-darwin-amd64"
      sha256 "bc2f3a3fff5ef3f7da3061e984b2f15f15fed14a445872ab10047ebee6a60424"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.8/astonish-darwin-arm64"
      sha256 "ad3d9cbccae8c2fbc2d370570f565f61b38026015318803dd9803cc21eefca0e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.8/astonish-linux-amd64"
      sha256 "3724b90d4e91c7cd06f7d636d88ae9a8b08211310224100873e959e680ffa4a0"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.8/astonish-linux-arm64"
      sha256 "4ca4d323a0d9221e0931c2a33478320f1ca552923f5056cdfcd19c5745fa9c70"
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
