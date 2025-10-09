class Orkes < Formula
  desc "CLI for Conductor - The leading open-source orchestration platform"
  homepage "https://github.com/conductor-oss/conductor-cli"
  version "0.0.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.13/orkes_darwin_arm64"
      sha256 "0159cd805db887c42791339d15c10ebd16e89af10e951e6143bc2aa7f83939e3"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.13/orkes_darwin_amd64"
      sha256 "21afe6f2b87df9fb7bfb23a3c4a153bc4a7ad008376ec9778954577d79354e70"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.13/orkes_linux_arm64"
      sha256 "42495ea60ee9500abe4f91a32c4e335ebdced7848d643b90f2f4f93dc89418be"
    else
      url "https://github.com/conductor-oss/conductor-cli/releases/download/v0.0.13/orkes_linux_amd64"
      sha256 "4b4b94b120216f2a4d4c21ebdf4d489f9e975ab82f422b72fce7acb91c87b586"
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
