# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "3.0.17"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.17/astonish-darwin-amd64"
      sha256 "d44c7959543ad0b2eac4c28d96b5cdb7316648962a38a3e16599d3ffafaa0523"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.17/astonish-darwin-arm64"
      sha256 "ef0a5dbdbbdb6a6274869821053ab436135f1aa3f65c777819255874fef1c90f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.17/astonish-linux-amd64"
      sha256 "53dc4d3745c214bfcbd7b4c4ce8b0f43b57d9c93239105203a2b40dcdf5a2e82"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.17/astonish-linux-arm64"
      sha256 "0ba7ede60bb4641ddd107a96b96dce4fd2392152de16a607b32a28c94a6d2744"
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
