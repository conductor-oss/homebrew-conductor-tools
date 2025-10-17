class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.24"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.24/orkes_darwin_arm64"
      sha256 "2198d389f740db11d0e78076d44758e5a0734165fa560d4d92a1d44b24f02e16"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.24/orkes_darwin_amd64"
      sha256 "456c5466c59b8f866e6fc7fa8ed5e37575986275a2148425bb4e61be1883188f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.24/orkes_linux_arm64"
      sha256 "5c89b97c261b32e999913c47fc1868005602608b2dfd8e8220f7a364ab0f555c"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.24/orkes_linux_amd64"
      sha256 "cfd29d28f0efd843bce9d266d8fccb35c2c7a03c61260e760064bc2337ff4333"
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
