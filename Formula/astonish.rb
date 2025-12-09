# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.0.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.5/astonish-darwin-amd64"
      sha256 "580c3bf9c163e2bcd6b8805364df88a8fa545686d984709570046c14b28a3c60"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.5/astonish-darwin-arm64"
      sha256 "f948b4db6684a5b13eeb0f4e16cc14262779cafef1e9fe63f149c2730afac193"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.5/astonish-linux-amd64"
      sha256 "c0ee6aa32644595d2e9fae11271896df31802146aa45eecba72c66ae015de92e"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.5/astonish-linux-arm64"
      sha256 "c86399d8a509a8f4979a3742a5fa135cb369a9195969b66face0093a7ca2b8b2"
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
