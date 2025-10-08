class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.8/orkes_darwin_arm64"
      sha256 "9c38d8c4119038f12aa524c3d56d66ac5a87a8329556c9fdc6836ecc49b8ed94"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.8/orkes_darwin_amd64"
      sha256 "9b8f2665a424da74258c3f88da5c1838e39669393698d319b8ce3b952c52f547"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.8/orkes_linux_arm64"
      sha256 "03c4b18925d9df13843fb8bef11208f5412f8767f7ac66a2963372e722f2ac18"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.8/orkes_linux_amd64"
      sha256 "9936d5e5b7d37a8f833420dba587faedd4fd225353ff64e03c2c44f8610ca2d0"
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
