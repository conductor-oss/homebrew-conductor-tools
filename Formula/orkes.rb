class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.10/orkes_darwin_arm64"
      sha256 "19cb15805e853ce7971c567cb120c281600904ed25329bcd1f9c994a46874839"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.10/orkes_darwin_amd64"
      sha256 "f9fcdeafcfd59388fb69df23ee43bedc0fc8e1c4c8f442fbc7b39e1afaecd883"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.10/orkes_linux_arm64"
      sha256 "4f8fb3a35d816b0f74301005b98dca1a7d0d332d990df77c54c68f895bbc1830"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.10/orkes_linux_amd64"
      sha256 "c13b80f64c7b9ce920426ec52cc6cb97c664c0eb02904f24e33fbd6f7ee46929"
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
