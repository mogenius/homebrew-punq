class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.2/punq-v1.4.2-darwin-arm64.tar.gz"
      sha256 "459eaa10ffb6ef8c64ed85f3e4703b871c81008afcebe961c4168ea717b5d557"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.2/punq-v1.4.2-darwin-amd64.tar.gz"
      sha256 "0a15746f362966003e50cfd2a8adcb0b30a4e0b44d11b600b99bf66ae39a52a6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.2/punq-v1.4.2-linux-amd64.tar.gz"
        sha256 "30e07c5023a524a664e1b864dc955a88c644c1c62c1128f5b3a4c6e245e95622"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.2/punq-v1.4.2-linux-386.tar.gz"
        sha256 "2bae4e46fd408a9fafe9bfebd7fd30c0a9d4bb206c57b01fc2fc643b19d1aef0"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.2/punq-v1.4.2-linux-arm64.tar.gz"
        sha256 "07e5e7e9c9bbb387d34747215125e395b863c8d6be34f35b16d071ad69d4247b"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.2/punq-v1.4.2-linux-arm.tar.gz"
        sha256 "248572ab318d698d3ca6a790913542d0efd2b84ef49aa9752a4b254a7aa96734"
      end
    end
  end
  
  version "1.4.2"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.4.2-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.4.2-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.4.2-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.4.2-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.4.2-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.4.2-linux-arm" => "punq"
      end
    end
  end
end
end
