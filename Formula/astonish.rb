# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "3.0.7"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.7/astonish-darwin-amd64"
      sha256 "4b65cf63b86a22ef3017268f0f63abfc1640e4d1a8fd1eb7b78324b72ca562ae"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.7/astonish-darwin-arm64"
      sha256 "0dd151b13245867749614c2fa6713670dad0bff3790a26570e0e08127b0cb94a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.7/astonish-linux-amd64"
      sha256 "8451bfbcd73bfc6d8d03b8b2770f4930cef6578b721d37d052352fb6bae37eb3"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.7/astonish-linux-arm64"
      sha256 "9ec1f72f4fd4e6fd1403e1887983eb53b765eae2ea3b58ffbb7db8d22ef959d8"
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
