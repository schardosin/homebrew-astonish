# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.7.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.7.0/astonish-darwin-amd64"
      sha256 "ddfbbb9648eb6d5570c67fd5120864419aa8d08a44822a33ef17fb58bc9bb43d"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.7.0/astonish-darwin-arm64"
      sha256 "51eed7bad69ca45902c84f6770a0643d9a1d5439857f68e965346dea81c28e4a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.7.0/astonish-linux-amd64"
      sha256 "e07c728b513762707380aaf02348c03c9e147f03cafe1cf418be1a5921d2eea9"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.7.0/astonish-linux-arm64"
      sha256 "a908fa24012b9e8f5efaba4d12a07f49e96234e4caa99cbdb201667c0ae42c68"
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
