# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.4.12"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.12/astonish-darwin-amd64"
      sha256 "3d5ac9824b84174df0b2512fd39a0cd63811b93c73b518340bc8f38c7bbf9228"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.12/astonish-darwin-arm64"
      sha256 "ab9dd36431185f9e1d6d9214c31519a2232fb4dcfcdab644d1daa3f9341ee7d4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.12/astonish-linux-amd64"
      sha256 "7e68c3e5bba43aba25fc0e4eb92425c439ea2a37d9c8235f7e6c50397e66d91d"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.12/astonish-linux-arm64"
      sha256 "18b1aca1f8184fda31f1d9579bfde1c3cbddb69760343c06eca6a4ca483358e6"
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
