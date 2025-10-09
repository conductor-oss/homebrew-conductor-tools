class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.17/orkes_darwin_arm64"
      sha256 "9affc3ad9f00bb55385b1aea4cebcb364c8866443bd93185e36a60ef9c2c590f"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.17/orkes_darwin_amd64"
      sha256 "f2c8f01fca4236753701c69e5e4677a2f6c2e17b19616afe421b411c3e6e551b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.17/orkes_linux_arm64"
      sha256 "bd9f8c583c22461aaff565b1ced89a631b4c8a8f9724b8cf598f1df4ac3c36b7"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.17/orkes_linux_amd64"
      sha256 "e0b9a7f51078a4b1ddd4afb9a3ce952ef13aee1139caf6095c0125a7fa58a0f4"
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
