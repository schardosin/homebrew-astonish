# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.5.14"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.14/astonish-darwin-amd64"
      sha256 "82121a38e7f68d55f4c6d4e140efdaff6665a76ae1a1648d77dbb5295aa1ae23"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.14/astonish-darwin-arm64"
      sha256 "6f624e777874dfbf5c0b5f184789f4aa2f2dee2b153ea9ada7f31fc0f41f2373"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.14/astonish-linux-amd64"
      sha256 "2c81d28cad3463785d0f2c34b0e5df03fee9f1714fe4909b5efa0a8ef0e73d1d"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.14/astonish-linux-arm64"
      sha256 "e387e5b15827425745987b666d7450c8140ecc2442e98519a256dfcd565eea97"
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
