# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "3.0.18"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.18/astonish-darwin-amd64"
      sha256 "610b6962a7f0e9731965edb09c643658b9fd4d64292ae2fd8ebb05b0acaf8c2f"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.18/astonish-darwin-arm64"
      sha256 "0af0a24b37934a745a9fb560fbcc01cb475d5a8c507a741e6468e9700e867f3a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.18/astonish-linux-amd64"
      sha256 "f99201c9afdf489e9a8dc48eb7913e196f334428a86ef1c28133c507d3878172"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.18/astonish-linux-arm64"
      sha256 "26ca93dd1a366e1debf44f4cc7ac234b933761efb0d6c7a0d1868808c0622aae"
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
