# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.2.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.2/astonish-darwin-amd64"
      sha256 "e754884dd7ffea2d1da0e9b4a9479971ae26eeecef9b13162f5cde07a7fe600c"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.2/astonish-darwin-arm64"
      sha256 "14b096c8aacbedc09a32eecbe33fdf58a62d6ac8967662cc60fd74434c4c594f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.2/astonish-linux-amd64"
      sha256 "483213c1971d313474d321cd5f758a652d276cde46ecb6d184ff2e449c7bc87f"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.2.2/astonish-linux-arm64"
      sha256 "db4cb86a4ee59cb2413834dcd8ed5af9d58d577a72c38859e2d491c452e75983"
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
