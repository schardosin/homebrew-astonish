# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.5.15"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.15/astonish-darwin-amd64"
      sha256 "f203a770c8d6216cd024d3d34e7dbda14d129f0075fc77823183520b9024c1e9"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.15/astonish-darwin-arm64"
      sha256 "8d05a177dc0621300b2eaf192e202e6572b1cc09642042cba45c4081ed5d3659"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.15/astonish-linux-amd64"
      sha256 "a7b8d77d434a951c1dc8490827be296f2fafa7a7a0ea65999bbe31c8d7524465"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.15/astonish-linux-arm64"
      sha256 "f3ca85f5489bca6c934bf5197b97d7c0f8584552b838fbe7a2a99b3e34770bbb"
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
