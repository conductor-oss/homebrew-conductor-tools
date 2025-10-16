class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.23"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.23/orkes_darwin_arm64"
      sha256 "2fe8e01cb964f6cdf16dc01eabad01e5add98ec9c2bc32b6d09edd00464c5966"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.23/orkes_darwin_amd64"
      sha256 "b01129dacf5e79d2967d042ecaf6ccdb0247e225aa1cbcf5e3f16a80f2a10070"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.23/orkes_linux_arm64"
      sha256 "22ce95a995877fbd12cd0f222e5aa92ebcb388cecdad36800cd266dfac2f016c"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.23/orkes_linux_amd64"
      sha256 "b14d52ab9c139961fb366c1909f563b38b5fc7903dc2faead07195924d735c92"
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
