# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.3.0/astonish-darwin-amd64"
      sha256 "b8cbc0385692cd00ba90aa386ebd35c0939a73eec8df60a38ea6bba35657314a"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.3.0/astonish-darwin-arm64"
      sha256 "dc88ee26a4764755a5b28c6f558fbcebc9e495baea6a133fe2d216a53b420256"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.3.0/astonish-linux-amd64"
      sha256 "40ddf3d649408bbd32e768e5b8cc84f4c244527928eda2ef4eeeadea66a61a12"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.3.0/astonish-linux-arm64"
      sha256 "0ec605ee2aa8bc6a4d29881c56e5675779fa52067ce42203e737e5af4009e108"
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
