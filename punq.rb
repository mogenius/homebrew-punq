class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.3/punq-v1.5.3-darwin-arm64.tar.gz"
      sha256 "c4126e8eb80d61ca6357350cbe5532bbf8dd9b24fa9f341a5679a27b7a83b5ee"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.3/punq-v1.5.3-darwin-amd64.tar.gz"
      sha256 "1f1a781feb87b5ac4e5982960816315f4ba7ca8150228fab0ee5d2408d0cbd09"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.3/punq-v1.5.3-linux-amd64.tar.gz"
        sha256 "830e97215887ccc7139272d7ccbd86c5c41debc68481410c2e6d17571e6719ec"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.3/punq-v1.5.3-linux-386.tar.gz"
        sha256 "f51c327ecbed9aac124a244bf7c7503832ed8eea0901d7d936174e2b623b5ee4"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.3/punq-v1.5.3-linux-arm64.tar.gz"
        sha256 "12f2400c6978162d75fed8e5922422d5a1ce1479433bed4e7d3db36e58f0af33"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.3/punq-v1.5.3-linux-arm.tar.gz"
        sha256 "6045e9738df111ad7427e82b84a1d3bc2e89be9d4cd9d9860f17be4de9b38659"
      end
    end
  end
  
  version "1.5.3"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.5.3-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.5.3-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.5.3-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.5.3-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.5.3-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.5.3-linux-arm" => "punq"
      end
    end
  end
end
end
