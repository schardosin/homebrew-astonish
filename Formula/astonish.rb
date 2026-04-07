# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.6.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.2/astonish-darwin-amd64"
      sha256 "110dfd895777d512328c95981373ce383fb091849b40de0cf7b89b11726e5d19"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.2/astonish-darwin-arm64"
      sha256 "6aeee1563428d6cbfd86a44ea71d986b33a02ac1c99a16375fd2fae83fac456d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.2/astonish-linux-amd64"
      sha256 "21862d4e14264a94db0c0da9062222921258e95e5bbd31e597dc714ceffe93f4"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.2/astonish-linux-arm64"
      sha256 "de1c831129b925f291d83df669de9938b21db2f41eb6dd7bccf2d45bebad205e"
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
