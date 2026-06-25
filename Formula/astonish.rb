# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "3.0.16"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.16/astonish-darwin-amd64"
      sha256 "90ef0c878ed53ca860478a7fdec42f3fc1dd281ac59cc0f0f2216ce4e75d38b4"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.16/astonish-darwin-arm64"
      sha256 "162cdbb184336b296fc1c8968a6563c00bb004a33e59795491acf84c962950b0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.16/astonish-linux-amd64"
      sha256 "9ab630071759f91a3b9ad8c793db8cb75c3fee0aff32225789d6a2bbc4e7b4eb"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.16/astonish-linux-arm64"
      sha256 "7df4a0d05002e2b0f2260e05a9625613bc0f7c39678b2853c82adbc65f9123f2"
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
