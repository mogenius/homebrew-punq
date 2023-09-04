class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.42/punq-v1.1.42-darwin-arm64.tar.gz"
      sha256 "8f1a6b7e9714aa161e4689e0bb96144e148b35288e6980743e74d134e0e8ceee"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.42/punq-v1.1.42-darwin-amd64.tar.gz"
      sha256 "49156aa0672aa09420a70a4f971dcd5561f38dab0b7b3124ba2589010730232b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.42/punq-v1.1.42-linux-amd64.tar.gz"
        sha256 "f14d2c94a07009596a7dbf5e272fc0e443799a9a00cbe7c07f2459b86ff21cf8"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.42/punq-v1.1.42-linux-386.tar.gz"
        sha256 "2ad32ab997b31751334e87d0d1783e63a607d02077587f9bc6930de513d42951"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.42/punq-v1.1.42-linux-arm64.tar.gz"
        sha256 "77e73e05cd5cc25d18ba2f0d07177b7eeee54f8ae2bb55c825ecb8a4604b8d37"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.42/punq-v1.1.42-linux-arm.tar.gz"
        sha256 "d629d6f7d3ee2a827fd71f148bca5f9fdf9b38dfad7dcab060304292ae9620e9"
      end
    end
  end
  
  version "1.1.42"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.1.42-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.1.42-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.1.42-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.1.42-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.1.42-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.1.42-linux-arm" => "punq"
      end
    end
  end
end
end
