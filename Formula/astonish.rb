# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.4.15"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.15/astonish-darwin-amd64"
      sha256 "73b93a862398b15eb25bda08bb62cd96498998ee9b0cf28ff106651aa67bdac0"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.15/astonish-darwin-arm64"
      sha256 "a53eac9fcf6f19270086fab4d5de6bea0b33bda321f61a84425145d2f6fadd2e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.15/astonish-linux-amd64"
      sha256 "fe4193e73cec30111a837904c5484b302e59979c919476d08f0ffacd2a9bfb7c"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.15/astonish-linux-arm64"
      sha256 "1fd87c350148b309b48ac4901c64defb82c6e5bf3c5a15822d54649b2139fb58"
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
