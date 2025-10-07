class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.7/orkes_darwin_arm64"
      sha256 "e34c35c9eec76c443a586168468a379c8865566ffcc3b223546bb1ee6371fba2"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.7/orkes_darwin_amd64"
      sha256 "a1c1a008ff866d98688edaf7a32c6092ffb939976a1684ef88aab127aed614a3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.7/orkes_linux_arm64"
      sha256 "761b7907638d9ff88b5c7a89913a250bed6ffae86818abe23bd9755d18415af7"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.7/orkes_linux_amd64"
      sha256 "d73a82ee1418ad8b9413ea5de611ab8cde3b2838bf753dc1aa05394a5f238d81"
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
