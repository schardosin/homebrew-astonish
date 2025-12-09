# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.0.7"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.7/astonish-darwin-amd64"
      sha256 "40748317f4f2702509becda229b307770bd2572e2e3232dbe4dbb28315244c62"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.7/astonish-darwin-arm64"
      sha256 "cd668d70ce7fefde20dc6c4cde802840d37ed282c6286b9051c0faaec559f53e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.7/astonish-linux-amd64"
      sha256 "84774079227b63b5ac699da6bffb2dab17b2cffa4cd55e8a12eff0792f2274be"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.0.7/astonish-linux-arm64"
      sha256 "8b30167a01b37473dcdbad21d0222e211a9928adf5a84877836829cf5bc57139"
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
