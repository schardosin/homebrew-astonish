# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.3.0/astonish-darwin-amd64"
      sha256 "b7ce8da6089aa4489afa4e5cb02a58e4de9e6691fb84854bda0afd7ed3d4c80d"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.3.0/astonish-darwin-arm64"
      sha256 "172487209ed0acfaaf49f0ecf9fe22387da765c377d2acea035b234243d37a7f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.3.0/astonish-linux-amd64"
      sha256 "c154083eb79635602c4b0451606d306b7454e2bfa22d7875d3bb247225e24558"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.3.0/astonish-linux-arm64"
      sha256 "6cfff547898364955abc92cd2ce4842175478ee779125d5317d20c3b98c13ad0"
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
