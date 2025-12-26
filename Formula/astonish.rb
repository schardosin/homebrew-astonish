# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.4.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.4/astonish-darwin-amd64"
      sha256 "56da177cc23485d1aeac6fa5dd56e774b87aa40ed780a9016105d1ea7681398c"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.4/astonish-darwin-arm64"
      sha256 "792607d82060a6fdb9daf80bb4c7f6f38a901bdb79610fc964436827221c3aaa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.4/astonish-linux-amd64"
      sha256 "c838f0d8c1e509b8213118a96da927bc6c904e695b16e625426fe9cab4eb3aa1"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.4/astonish-linux-arm64"
      sha256 "563804695cbfdef759914e50886a5511215f50fdeded55875683f2ec591815c6"
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
