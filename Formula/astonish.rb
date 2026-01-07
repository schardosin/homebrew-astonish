# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.6.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.4/astonish-darwin-amd64"
      sha256 "f3fcd5e42da579116a10c297253462587c90ef935bc31bc07f445439da02383f"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.4/astonish-darwin-arm64"
      sha256 "5448e613a912e90520c1f9348c82b9197330990f04d3af675a8eefc8fe0645b1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.4/astonish-linux-amd64"
      sha256 "8de4a0ca1cb6a57d6245ba2963a5b44147065aea9bd76a644ff1bdbe2f6f184b"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.4/astonish-linux-arm64"
      sha256 "fdb4e7f2394a1dffbb8ab245788fa5bfe7f045a8eae898bbfa21d23543b82ffb"
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
