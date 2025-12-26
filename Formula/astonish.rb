# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.4.6"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.6/astonish-darwin-amd64"
      sha256 "e466bef7e79d0fd4a203b21935b53c7e881570bc55a14ed0caf04bcc335c2a69"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.6/astonish-darwin-arm64"
      sha256 "a29bd6bae4d8c035ce2511d2e50621c29294726ed15e980863d11e48794f0f7e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.6/astonish-linux-amd64"
      sha256 "753c4787bbe5b85ff59f54f48fbed1883663c758505188832b8983386723f91e"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.4.6/astonish-linux-arm64"
      sha256 "99bff1d30f5b845df5abcf7a9c45596ffb70e76c94d3dfa6306e4818a99bdfd5"
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
