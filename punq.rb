class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.4/punq-v1.5.4-darwin-arm64.tar.gz"
      sha256 "4a9e58f6876b11388657ad702bbad8523e1fc44fedbbf8c96d5f0083dc9f2b9e"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.4/punq-v1.5.4-darwin-amd64.tar.gz"
      sha256 "0e7c9e960c22c9bc6b1034feb9516716f7bc822e3d3cb1779a21603b3204bb7d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.4/punq-v1.5.4-linux-amd64.tar.gz"
        sha256 "863eeb7f1ff1247857d4c79c1f6665ab0bb31f633389d7c6bca4141c070799c2"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.4/punq-v1.5.4-linux-386.tar.gz"
        sha256 "3697c2dea7bbdee64e4e3e973355d87046a7c63a0d22d90964e1a56e4bea2a33"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.4/punq-v1.5.4-linux-arm64.tar.gz"
        sha256 "1d7a3c233b1636b18dd92ddb480a94202c5fd388a0e0177c6ab4e3d6af62683b"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.4/punq-v1.5.4-linux-arm.tar.gz"
        sha256 "898a3ce6b3b0c1751c304a95ad04e814be1df21ccb94cc26ce3841a6e5da0549"
      end
    end
  end
  
  version "1.5.4"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.5.4-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.5.4-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.5.4-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.5.4-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.5.4-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.5.4-linux-arm" => "punq"
      end
    end
  end
end
end
