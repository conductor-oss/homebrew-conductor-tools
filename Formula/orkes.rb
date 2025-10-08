class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.12/orkes_darwin_arm64"
      sha256 "73c5f4a0519c62a451316cba461f1bf04efd542c25cb029e22b20ad266326a34"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.12/orkes_darwin_amd64"
      sha256 "ac7f44babf57501662aa5f1e5d3bba97fc44e9c9f4efbef0634c702a37857abc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.12/orkes_linux_arm64"
      sha256 "a5f7fb35fc914f204325011d6b1373415464cf07d2250ac1b5c632a2df932a20"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.12/orkes_linux_amd64"
      sha256 "32015e61fd96d69a54ac41602ae91c1a84b6cb87ef155b019e419597f0e6ea6a"
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
