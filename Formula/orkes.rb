class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.22/orkes_darwin_arm64"
      sha256 "4c7aedc9ef83748ce98fb7814d430d5834086a7e409b73fe228a35d977dafbfe"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.22/orkes_darwin_amd64"
      sha256 "3a308f3f05a09b4c03c39443c0ebda6270f822667df8ea882e91f373d06d0526"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.22/orkes_linux_arm64"
      sha256 "b06ba47104c81e82e8e397d6a5f593634af01ff0d85b8a7d58557d389e1348b6"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.22/orkes_linux_amd64"
      sha256 "48c017e5328f97d42cbbe3af25c6bb9146ef388f28cbd3fe66d1064783de3216"
    end
  end

  def install
    bin.install "orkes_darwin_arm64" => "orkes" if Hardware::CPU.arm? && OS.mac?
    bin.install "orkes_darwin_amd64" => "orkes" if Hardware::CPU.intel? && OS.mac?
    bin.install "orkes_linux_arm64" => "orkes" if Hardware::CPU.arm? && OS.linux?
    bin.install "orkes_linux_amd64" => "orkes" if Hardware::CPU.intel? && OS.linux?
  end

  test do
    system "#{bin}/orkes", "--version"
  end
end
