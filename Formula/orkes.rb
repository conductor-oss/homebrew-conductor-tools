class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.19/orkes_darwin_arm64"
      sha256 "c8767f0cb708160b7aaf4afc9942bbd05742575c8475faad9e5581021f115c62"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.19/orkes_darwin_amd64"
      sha256 "efdd2404aae8db1783d268e0f83b6aab5e1cb4f04c5164cdff26628bb95ae92e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.19/orkes_linux_arm64"
      sha256 "208a0416b9500e42fe9d12413a7695c90b33777a34d7e910ab03292ad7260177"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.19/orkes_linux_amd64"
      sha256 "1d27b8fdd1b2f7f2b089c43e40d95b4984aa72633461d668171be0d0259db030"
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
