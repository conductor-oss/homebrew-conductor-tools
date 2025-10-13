class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.21"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.21/orkes_darwin_arm64"
      sha256 "1ad72ed9238ea37284f3bb6907145999c02f7bddc1ccc1476b0292686ea13c4e"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.21/orkes_darwin_amd64"
      sha256 "7d3996bce4c55ecdece3f4d02e2c083f14a87ab5232cb2f6945d6ab276f3cbf1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.21/orkes_linux_arm64"
      sha256 "5a2704b17ea14e371c1a0650ff9241f916459f79109e0e426832c8197d53f169"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.21/orkes_linux_amd64"
      sha256 "f4fa9b563477cb687ac35265bc8f80fe62bf1d0cab401b5c68b46e6923d5e64b"
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
