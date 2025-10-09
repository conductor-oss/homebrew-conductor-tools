class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.18/orkes_darwin_arm64"
      sha256 "12742cba2ddf20d5db4f589e2f8ee6a664ea8c5f59fa82071862728bdf1dd3f2"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.18/orkes_darwin_amd64"
      sha256 "6bf27e5f5fb770b361707de78d6e03b702278c12b724001bddaad2ca27ef9327"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.18/orkes_linux_arm64"
      sha256 "688a94fdb3e527f06adaf63a53a5814542fc4e40f3000197ba59f2e00c47d729"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.18/orkes_linux_amd64"
      sha256 "542e03542cad347f141efc901186822eaa0ed0c7e947f3693a244edfa7594d8f"
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
