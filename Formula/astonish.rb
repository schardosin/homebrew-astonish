# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "3.0.11"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.11/astonish-darwin-amd64"
      sha256 "180baf53f63eb328e3b727076f8f8f7a64136ea1520f5478c3f1c277bf789d1e"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.11/astonish-darwin-arm64"
      sha256 "1a8dfca0a34d6374ca05a9081910fea249909eca4af76bc6df9f266056053c09"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.11/astonish-linux-amd64"
      sha256 "95eae359d599d27cdc0daa35746d07c1ce2ac63dec41ba3f845cf229ed086c93"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.11/astonish-linux-arm64"
      sha256 "e442736ef71109470bec3c914f4696765c11f05fce7fbd4ca8029154d074224f"
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
