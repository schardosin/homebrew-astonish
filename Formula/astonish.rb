# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.4.11"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.11/astonish-darwin-amd64"
      sha256 "5c2c5f0f6dc8831846a2ba03a259833bdc86b929d5c1b9905c055f68e585e61b"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.11/astonish-darwin-arm64"
      sha256 "0c824d2ad3e00e58903098d753ddd5188c38ea861e1c60c5ae286509ef73dcc2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.11/astonish-linux-amd64"
      sha256 "4d84d54a2cb87873775336f81cddc81a16f2123c793ec7a1ffd53f4d95e3da5c"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.11/astonish-linux-arm64"
      sha256 "25f100edd3661543e796cc93e85e5c150817895f88f6edb4f9f869148dc3a071"
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
