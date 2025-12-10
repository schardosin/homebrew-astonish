# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.0.9"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.9/astonish-darwin-amd64"
      sha256 "e738a73850df9e51d2bdf64311be63b163e7e03fe2918ac8a9e9ff4c6d05c02f"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.9/astonish-darwin-arm64"
      sha256 "eca034a374476245e31f8fed5e56c8960f0c83fdd4f9ffaa0fa380722aa0026e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.9/astonish-linux-amd64"
      sha256 "a3e4eac8679dbecfc9ccd85e4a684290a656b52f070b80041d7a9c012cf841f2"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.9/astonish-linux-arm64"
      sha256 "f58dfe0859584a193b16bb40919356b786ca2425e0c47157ed9a53bebd72e6a2"
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
