# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.9.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.9.1/astonish-darwin-amd64"
      sha256 "26ac7fe0edb5bd74fce496858968837d2fb9b2d6ee49f7f35096ce3c7a161241"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.9.1/astonish-darwin-arm64"
      sha256 "4046eee13d82ec7bd4c9043f42bee519ca1508a2946853ef3c2ae9c21a6be042"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.9.1/astonish-linux-amd64"
      sha256 "1898c704c98b1e45ad1b90f041f1dc08df74723e4363e4e38ffc1f611362e64c"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.9.1/astonish-linux-arm64"
      sha256 "52a7f06e2432ffbb5f6ba804c33470d7978134b2198cd642f363cbb7c647d084"
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
