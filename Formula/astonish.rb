# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.0.13"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.13/astonish-darwin-amd64"
      sha256 "e42b998d129e19eadaff70252d12db972ecb8334e2d4eea33486d6b5752eb003"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.13/astonish-darwin-arm64"
      sha256 "7cc47dd985dd594181f12bee070b8bc1473ec01a5c0b33fe13ba66cddcbde53d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.13/astonish-linux-amd64"
      sha256 "f6016956e9b2acb573f9f416bfbe35741680b7d821573a85c3997bd0f401d8e8"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.13/astonish-linux-arm64"
      sha256 "99ebc2e83cbf85d7dbfd958dcf55d6d096433130d3838cc71a247d35de0808a0"
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
