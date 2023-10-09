class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.0/punq-v1.4.0-darwin-arm64.tar.gz"
      sha256 "16cd580be1b26284dd8cabf59c0b9d20c13a9137033c2a3701e80305b8b6453d"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.0/punq-v1.4.0-darwin-amd64.tar.gz"
      sha256 "6b9457e471a2f129095ecdeeb9e0721666e24f0f0b097b09fd2ff561fa266633"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.0/punq-v1.4.0-linux-amd64.tar.gz"
        sha256 "eb2681c509cf97dc93e3f9ddc705dd0b4c601f1991cb4748536b129d658688f0"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.0/punq-v1.4.0-linux-386.tar.gz"
        sha256 "017bcf3a56e1428bb29a5e8c189692f1af93a2cdb56dc66a6ab71d2e117caf6e"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.0/punq-v1.4.0-linux-arm64.tar.gz"
        sha256 "f933a4ac329a1966718b9665714222b1d5ca1d997544ca73430523cd37091963"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.0/punq-v1.4.0-linux-arm.tar.gz"
        sha256 "bd5333bf1b4f4cc1c2ec4854074b3962f4d8c0891ee84544da025a690f59f1a5"
      end
    end
  end
  
  version "1.4.0"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.4.0-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.4.0-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.4.0-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.4.0-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.4.0-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.4.0-linux-arm" => "punq"
      end
    end
  end
end
end
