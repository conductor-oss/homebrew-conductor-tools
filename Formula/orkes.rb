class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.14/orkes_darwin_arm64"
      sha256 "a5c8575ebd5faecb0715e3fa34131c892e1e42510377a6bf4f89fd4673f0170a"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.14/orkes_darwin_amd64"
      sha256 "6e426d92d3cdbab506480e91acd120920de758b012f68baa561beb90a67304f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.14/orkes_linux_arm64"
      sha256 "8da1205367ae72d092067a06d9584635f15e94c6fd86c7e47d82479cd2a218fe"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.14/orkes_linux_amd64"
      sha256 "f6d5a0ab0aaca56a60463240761e33234bb42455b595d1928229d0f9a590b2e7"
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
