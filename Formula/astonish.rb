# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.0.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.0.2/astonish-darwin-amd64"
      sha256 "85a75633b00dffa1c5138548bbe84c9b65f2391bcc3726857733a630f25e6a90"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.0.2/astonish-darwin-arm64"
      sha256 "5cd2e3ddfec76b0caa91e5cb15e3dd351c2fb1f71880d4d0fa42e94a386958d3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.0.2/astonish-linux-amd64"
      sha256 "87ef829a9d53cccc09a3d9a1c7737e1e3e8c8e5109bea615e1bed7f1bbefcfde"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.0.2/astonish-linux-arm64"
      sha256 "e3e44e8c5fd5d7eac1ae62072c83a239f85a213465cab42ceb478c0bc15be047"
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
