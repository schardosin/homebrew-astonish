# typed: false
# frozen_string_literal: true

class Astonish < Formula
  desc "AI-powered terminal assistant"
  homepage "https://github.com/schardosin/astonish"
  version "1.1.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.1.3/astonish-darwin-amd64"
      sha256 "23def3bed9444b8c123d19db0aade354c3094ee08eae685a6897ab1e134987bc"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.1.3/astonish-darwin-arm64"
      sha256 "d43b934957e3e326a1622abbd0dff3daebf7910679d252caab1ec724a4d41d6f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/schardosin/astonish/releases/download/v1.1.3/astonish-linux-amd64"
      sha256 "c3c97481fd282a7cdf486e11739a4d7cb76f20cdc6369a330a218bfde252cc10"
    end

    on_arm do
      url "https://github.com/schardosin/astonish/releases/download/v1.1.3/astonish-linux-arm64"
      sha256 "1c77ba842af684af4568472a55b75b020d1306fe38c2d1f196813ccaa23b609c"
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
