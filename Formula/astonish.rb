# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "3.0.12"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.12/astonish-darwin-amd64"
      sha256 "309708298f18f640fbddcc39c34fc4959b0c3d744e00858b66c88018d44626fb"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.12/astonish-darwin-arm64"
      sha256 "32478b6ec35fdd466425949a32f923846d3fd77a70ea096eee1d03c56987d445"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.12/astonish-linux-amd64"
      sha256 "0985b141dcabd3987b8651e7eab22b3ba01cd0ed85837db473461e808eddfc73"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.12/astonish-linux-arm64"
      sha256 "353ad9f3cd72a1f07c689545d76801998c4920d86b9e2079ab2de5daf6689fcb"
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
