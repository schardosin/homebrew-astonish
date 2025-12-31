# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.5.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.2/astonish-darwin-amd64"
      sha256 "ed51476cf252f0f69f5fcaedcb88e7427796bd4568f78945dcf2ba3af31e3128"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.2/astonish-darwin-arm64"
      sha256 "796ae25c5c45c5c0e7076cc8146a666d18d83d9395d4e08acc9abeae2ac44a89"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.2/astonish-linux-amd64"
      sha256 "70f9f867f1302d4eff6bfc0ca6410656cad456c4f0272e41da26d8fc4789455d"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.5.2/astonish-linux-arm64"
      sha256 "7ec9fba5ff492a550432efcffe8e42250ecb7802b5b0cccefbd0983ada7edf1b"
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
