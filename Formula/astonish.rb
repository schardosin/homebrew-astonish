# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.3.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.3.3/astonish-darwin-amd64"
      sha256 "2fe9050b152b4383355ab94af7a0188c228869ce1e12a258dfb3c15ed26a0f0f"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.3.3/astonish-darwin-arm64"
      sha256 "53d87866472bb1f156e70c831a4435e7f92fb8014a730686e30bef1e7c0ecb12"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.3.3/astonish-linux-amd64"
      sha256 "cc0b724583d6a61cc059e273a60b1ab6494e59e42972fbebf9ba7339a595a739"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.3.3/astonish-linux-arm64"
      sha256 "0dc40b2080b5b278b84ff7d30cf84e076182ba39949110fe63048438f1cd2041"
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
