# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.5.6"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.6/astonish-darwin-amd64"
      sha256 "e6c888072a020b367829675b504737ce320912d861ef6b56a8cc64315afde805"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.6/astonish-darwin-arm64"
      sha256 "c864ff133fb9a1d44b776e69f4db281bbaa6ab1c651499d80cee9f9a1e580fd6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.6/astonish-linux-amd64"
      sha256 "cc5a82f3692eec55cfa4485d807d62f3b47c38f965e019cbf255af1ac468fd8a"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.5.6/astonish-linux-arm64"
      sha256 "cdb3428b2880266ef8a6bbae3c7b9809acafac0576ad5083b21b3cb40c8a4261"
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
