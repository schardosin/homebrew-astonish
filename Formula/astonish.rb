# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "2.6.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.4/astonish-darwin-amd64"
      sha256 "9c7c9c8524ada4f957a052da899b551b0e5f63249689fe91e3dd4ae701a1e6c4"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.4/astonish-darwin-arm64"
      sha256 "0fe0390b374434cae41c9116266cf815728f55acb4cdb05da9943726c3a9de2b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.4/astonish-linux-amd64"
      sha256 "61ac94ef850d6fc76240a59bab99a37a5b20cc58529a75117dfbe4fa4cbc3e9f"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v2.6.4/astonish-linux-arm64"
      sha256 "c98b48f39c94e7967c780586ca19005777fbe0db96f3334e9faef686ebab96d3"
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
