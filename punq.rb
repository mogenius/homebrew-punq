class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.11/punq-v1.4.11-darwin-arm64.tar.gz"
      sha256 "25a2055a9082e8a32403dc1301d04fc614348103fb28da0c259b9b07e3163975"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.11/punq-v1.4.11-darwin-amd64.tar.gz"
      sha256 "f14a8320d44ec3100f657ed4f70b851bcf99dbf8dcdc8ddb4c27fd16ea7b6ca9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.11/punq-v1.4.11-linux-amd64.tar.gz"
        sha256 "9ab4f277bc98c9a4f385c7c3b90f131c7cc27bf62c4638b4479d67c0d924f02c"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.11/punq-v1.4.11-linux-386.tar.gz"
        sha256 "0aaf706025e1b1674f849dc88af9d8918f75e26a34af6dd7af0d9fdb9e8795b4"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.11/punq-v1.4.11-linux-arm64.tar.gz"
        sha256 "8352b9a3c8f0adbd9c90db35a9f195ec6eafc1d50c97ead3897575abb060a0d2"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.11/punq-v1.4.11-linux-arm.tar.gz"
        sha256 "207f024d4e658a994a9d37106d506587a92263f5eac7ec2984bdc8c7d66760c0"
      end
    end
  end
  
  version "1.4.11"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.4.11-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.4.11-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.4.11-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.4.11-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.4.11-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.4.11-linux-arm" => "punq"
      end
    end
  end
end
end
