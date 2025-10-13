class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.20/orkes_darwin_arm64"
      sha256 "455173bd17b99377a8db105a964098a12b4f8bb8ef4a7e435e7734c7d537897f"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.20/orkes_darwin_amd64"
      sha256 "318927b343a2c5ca327240de1ca91a8b83dfe5c86c47764ba017c809193299f2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.20/orkes_linux_arm64"
      sha256 "0af390bb1dd2d47bdd9b7f5769ae005b08364456dc5014e4f90bd8ade29544ce"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.20/orkes_linux_amd64"
      sha256 "a9444660923a645947f904c3db7a43458395c3c5581733c7ba8b99b172d640f1"
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
