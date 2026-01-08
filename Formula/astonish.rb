# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.6.8"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.8/astonish-darwin-amd64"
      sha256 "23ff52331a5b453f734aef8670073e2f2c2d463afdc42a9031546073f70e4c3b"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.8/astonish-darwin-arm64"
      sha256 "14831ce45a7bd1341b72f3d51b9084229cfd30892f54b41fb5803e02f1c5402c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.8/astonish-linux-amd64"
      sha256 "cf9a3c594701f8277e3acef62c34de7e78411af785b986401530313c980c5d0a"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.8/astonish-linux-arm64"
      sha256 "0d81b9219947a5013d72711f6d1093c59cac48bba83e5c113efc1897b5803e2a"
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
