class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.0-develop.24/punq-v1.3.0-develop.24-darwin-arm64.tar.gz"
      sha256 ""
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.0-develop.24/punq-v1.3.0-develop.24-darwin-amd64.tar.gz"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.0-develop.24/punq-v1.3.0-develop.24-linux-amd64.tar.gz"
        sha256 ""
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.0-develop.24/punq-v1.3.0-develop.24-linux-386.tar.gz"
        sha256 ""
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.0-develop.24/punq-v1.3.0-develop.24-linux-arm64.tar.gz"
        sha256 ""
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.0-develop.24/punq-v1.3.0-develop.24-linux-arm.tar.gz"
        sha256 ""
      end
    end
  end
  
  version "1.3.0-develop.24"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.3.0-develop.24-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.3.0-develop.24-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.3.0-develop.24-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.3.0-develop.24-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.3.0-develop.24-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.3.0-develop.24-linux-arm" => "punq"
      end
    end
  end
end
end
