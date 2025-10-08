class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.9/orkes_darwin_arm64"
      sha256 "e2249987a1973584e5eae00e42eabf05cc15a613644fef660e7bcfd465bfb571"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.9/orkes_darwin_amd64"
      sha256 "0fa3d4ecf3075efebf53b0d7c03dd4af4775b04f0f54380a83913d45b696fd53"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.9/orkes_linux_arm64"
      sha256 "b3933a860a5b3176353942976c205eda77ce849a8361e1ab179efe2d0d17c652"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.9/orkes_linux_amd64"
      sha256 "7fa600406dcf70a9dafbd22a8568d8620e04ee6dcb003b34057e340c89b1163a"
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
