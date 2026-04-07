# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.6.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.0/astonish-darwin-amd64"
      sha256 "da53399f764226859fa73367d5c6cc1127cbaef4f93a4af87ec48ec6d8639698"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.0/astonish-darwin-arm64"
      sha256 "21a8cc8f212607e1bb703efab1d71bf3629c7d94e0789c040b8b72b5db5c0e9d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.0/astonish-linux-amd64"
      sha256 "f148b307a73722d7900a1c95fe4bb6ca7ca301cc269b55d54461966b78bd0c8d"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.0/astonish-linux-arm64"
      sha256 "c33cb9581eb9393b668e1ccf88aa583c623a149606427f4c76dad73b6384eeda"
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
