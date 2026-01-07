# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.6.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.5/astonish-darwin-amd64"
      sha256 "1a7b29cd66662a38926c7cb815d862a356f98119836fbdbf01c5359ef5bb1730"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.5/astonish-darwin-arm64"
      sha256 "331b045dc0a0570fba36da3a17023917c8fee0552752236647b2bdfa4d7357e9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.5/astonish-linux-amd64"
      sha256 "40e72e6058a3a31bdc12520406f12e61e558e4c630916101325646ef84de74c1"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.5/astonish-linux-arm64"
      sha256 "78e359b399b919b7493e2376b309e69c936d6094d3d59cbb23264b901bf235a4"
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
