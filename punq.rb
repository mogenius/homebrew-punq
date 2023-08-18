class Punq < Formula
  desc "View your kubernetes workloads relativly neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.12/punq-1.1.12-darwin-arm64.tar.gz"
      sha256 "20f28c4c6f40887b9838ac60a997945751c57be7d8f0230945ad0a33efe7ada2"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.12/punq-1.1.12-darwin-amd64.tar.gz"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.12/punq-1.1.12-linux-amd64.tar.gz"
        sha256 ""
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.12/punq-1.1.12-linux-386.tar.gz"
        sha256 ""
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.12/punq-1.1.12-linux-arm64.tar.gz"
        sha256 ""
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.12/punq-1.1.12-linux-arm.tar.gz"
        sha256 ""
      end
    end
  end
  
  version "1.1.12"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-1.1.12-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-1.1.12-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-1.1.12-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-1.1.12-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-1.1.12-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-1.1.12-linux-arm" => "punq"
      end
    end
  end
end
end
