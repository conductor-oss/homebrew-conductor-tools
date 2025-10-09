class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.15/orkes_darwin_arm64"
      sha256 "66bc44333c0abd6fdfa46e555e9b8958056ff392a58d9cd528611fbb0e43980e"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.15/orkes_darwin_amd64"
      sha256 "0ff57c93ea81af35f693f6ad5a0f970b004b908c6ac7a10808f87d3ebae90d41"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.15/orkes_linux_arm64"
      sha256 "78c78135d55ca84ae20a8883a437629bb01a7d34246434827360e643f924774a"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.15/orkes_linux_amd64"
      sha256 "772224c51619dec756479c0502ff8b9e19ddbf0426daf58739f9789a71acce4e"
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
