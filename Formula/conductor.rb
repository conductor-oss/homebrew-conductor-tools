class Conductor < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.1.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.8/conductor_darwin_arm64"
      sha256 "aa7c5148bdc588b0f4b85a1b4b0380c6b1a6e2f72edfa36055e5cdc503c0f12b"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.8/conductor_darwin_amd64"
      sha256 "a2d705dd8ab7015e128f99be1b0796d17d3420dcbe38b91e4df2823a4b5d6494"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.8/conductor_linux_arm64"
      sha256 "8fb23c0bd44b479f8711f73167a1fa14c01ec34f1b11a4b445376a2c3c39c617"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.1.8/conductor_linux_amd64"
      sha256 "c3d0d8d4affb73ccafb200a60f53475111c199c4c8dffc83d49fab531c98fe1c"
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
