# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.4.9"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.9/astonish-darwin-amd64"
      sha256 "c208db874d69113da1f420d3b40590ef6e55e3eb27e75c803b15ae733dd45402"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.9/astonish-darwin-arm64"
      sha256 "cbff4a47f301c37a41f9c6956c7641012d7eda4eb43e49fa85602bb6eaa31952"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.9/astonish-linux-amd64"
      sha256 "ecc8b431977b5a8e34af333f561d15664f03b162f169c084fe652cda1e384503"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.9/astonish-linux-arm64"
      sha256 "04961498e3448d055c7db6b6e9fe2d5c219bc1e2abd367adbb97f32b13eeefd2"
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
