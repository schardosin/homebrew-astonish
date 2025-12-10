# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.0.10"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.10/astonish-darwin-amd64"
      sha256 "a9b6eb0f6a87645a2b5cc91193959fbbd7f634bb9f2bddeb644b1f9bd25fb991"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.10/astonish-darwin-arm64"
      sha256 "b4b352bb10874fac4746b0c89a80ff5ecde8b94cfea23b2a169e3c1877e4418f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.10/astonish-linux-amd64"
      sha256 "7b345e4ff33b79e2e01a9437cc267ed219042c54823668f5a3cdbb2ee0b62218"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.10/astonish-linux-arm64"
      sha256 "c466aa11003a2abb0cbf25f36b6d6381d26737c11b931a5e1f860fb007444da4"
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
