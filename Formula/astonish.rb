# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.3.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.3.1/astonish-darwin-amd64"
      sha256 "b697d81784a9a8bbc7717e5da10e8af68cd2718e450ca76981c1d449cc05cdf9"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.3.1/astonish-darwin-arm64"
      sha256 "4053e2ba195dec72b109c6c4dc0c050e7edcbd2bf26ac6d79f48329869ed9686"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.3.1/astonish-linux-amd64"
      sha256 "f1347abd81e4e67f48da6ef278d1a268daf87966933e4bbc54f67fb798d93ea8"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.3.1/astonish-linux-arm64"
      sha256 "814a82b27e371944468011d17ff865b579adfcdb054799752db6cafef8eb512c"
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
