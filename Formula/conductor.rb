class Conductor < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.1.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.7/conductor_darwin_arm64"
      sha256 "9bd66633cc7cd097cbf6423adb940d3f33c236cc78af23c5d181269643e72886"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.7/conductor_darwin_amd64"
      sha256 "ac27aecbc6c8326566fd56c47f4d8290734d302ef3a61b6394066cdac0e9f89e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.7/conductor_linux_arm64"
      sha256 "3614f0ae1b70468485a23c245386d0db7d36be6a8736cc94f6bfa10f428bb845"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.7/conductor_linux_amd64"
      sha256 "07b9fb735e79095df9bf7e281f426ea5f5329e9cbd95447e9a21ba54f2764857"
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
