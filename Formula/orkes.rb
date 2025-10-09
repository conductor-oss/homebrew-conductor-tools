class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.16/orkes_darwin_arm64"
      sha256 "ab9caf36d56853ef5c314a5ffac627e29825093cd65a548afec052ac86633ce6"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.16/orkes_darwin_amd64"
      sha256 "337748ee42135b8574735b2bf6ae38c574031270c1454fddb78a6ad19f85303c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.16/orkes_linux_arm64"
      sha256 "bc0f267ea86b7349b6b044948b4092618f01d8c9c344180eba41f18f455330a2"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.16/orkes_linux_amd64"
      sha256 "d9faad86ae32e7b0f5d91c8706eb7b1c73312bbafb383431e81dfa8cb124a3df"
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
