class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.11/orkes_darwin_arm64"
      sha256 "96452b351002388785b19d13036a9b3d44856f1b6805f0ee4389c29470794725"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.11/orkes_darwin_amd64"
      sha256 "65c122aa99d89fa1c56823d07ffd268f8112496b89977f763742dc6fe38bbdb8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.11/orkes_linux_arm64"
      sha256 "84d997f7efcce13b9dd6774f32f32716ee079a382c0104df91f787743ca165fd"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.11/orkes_linux_amd64"
      sha256 "af27a204736b407b18e1b8a01e722700147a2a27dd33e75784f863c71fd8d6ca"
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
