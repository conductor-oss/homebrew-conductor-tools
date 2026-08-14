class Conductor < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.1.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.9/conductor_darwin_arm64"
      sha256 "9195433801fe48159a6d7d998f3ffc9ff0b4f6214dc75b7a2035ec4f6345af88"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.9/conductor_darwin_amd64"
      sha256 "1d74915e8afe3462dde4626f3fc05edd04bade9e9bb765259161ff9eabf1b0bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.9/conductor_linux_arm64"
      sha256 "3a7e3effb0a06b691719e687870b69c4255f86cbd7bc97d93d8bc58712d8d2eb"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.9/conductor_linux_amd64"
      sha256 "6457ac9d4177ce5f02d648d300d16a2730843c049d264cab220f36672ece8683"
    end
  end

  def install
    bin.install "conductor_darwin_arm64" => "conductor" if Hardware::CPU.arm? && OS.mac?
    bin.install "conductor_darwin_amd64" => "conductor" if Hardware::CPU.intel? && OS.mac?
    bin.install "conductor_linux_arm64" => "conductor" if Hardware::CPU.arm? && OS.linux?
    bin.install "conductor_linux_amd64" => "conductor" if Hardware::CPU.intel? && OS.linux?
  end

  test do
    system "#{bin}/conductor", "--version"
  end
end
