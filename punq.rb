class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.41/punq-v1.1.41-darwin-arm64.tar.gz"
      sha256 "f7ec8784547501047300fee7664a0447f084502fcf80fcbe6cdd32fdcc073377"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.41/punq-v1.1.41-darwin-amd64.tar.gz"
      sha256 "6e29ed5d6a27a09f29e3bbdf8f18b2caced46ddd54370379674cea1a1ab6d88e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.41/punq-v1.1.41-linux-amd64.tar.gz"
        sha256 "1b9bfc4a93c9a8aa55b002646bb16698fc32f2b7860ed5366e2d403179828ed0"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.41/punq-v1.1.41-linux-386.tar.gz"
        sha256 "87490620d6ba6d3a04f1addd330aef203c295069932e27d81a0e21b18754c9d4"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.41/punq-v1.1.41-linux-arm64.tar.gz"
        sha256 "fd75ee21a07c660f7c5f13188cc42e7c9165fa6ee223b6fa9d4d6da56d7c65ab"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.41/punq-v1.1.41-linux-arm.tar.gz"
        sha256 "0e2d60db0fcd2dcad97f6b0ef97d53efd399a2a082d570600b5ad02416de6b22"
      end
    end
  end
  
  version "1.1.41"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.1.41-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.1.41-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.1.41-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.1.41-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.1.41-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.1.41-linux-arm" => "punq"
      end
    end
  end
end
end
