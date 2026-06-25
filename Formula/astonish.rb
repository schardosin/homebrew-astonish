# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "3.0.14"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.14/astonish-darwin-amd64"
      sha256 "651e72c8135adc86cc338b0febef9c03211fb8eb1292c36542a2b7efc38f1063"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.14/astonish-darwin-arm64"
      sha256 "60c2f472a7cc2d914aacbb50df6e37851a2a673cd4e6a5a4730559dc341c347e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.14/astonish-linux-amd64"
      sha256 "eb190918752e3eaa69919e152fe205e26b9dea0ed89839383e36652cdc1e2105"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v3.0.14/astonish-linux-arm64"
      sha256 "753c61a0ccbb23e59d7b56a2b66c7aafff394b6bc6b108cdde7ee263c42e6b6f"
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
