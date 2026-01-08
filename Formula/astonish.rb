# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.6.13"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.13/astonish-darwin-amd64"
      sha256 "fb271638872f239f3b783ac091e234ddd2360d082cfbbf888aaaac7f0cf76085"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.13/astonish-darwin-arm64"
      sha256 "765b36617c7c1a31bdd29b8ef6e296a672d07dfde4a694fa93b2140cc084be90"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.13/astonish-linux-amd64"
      sha256 "bcb77e329def481bd49a2b542d508be9eeb8f5a62267bfd7d05c8d50e9534492"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.6.13/astonish-linux-arm64"
      sha256 "653db1e8b84fc3ecf740400dd27b874009bb7275aeb389760b62bbe5ae9d7a31"
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
