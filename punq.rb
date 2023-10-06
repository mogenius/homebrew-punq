class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.6/punq-v1.3.6-darwin-arm64.tar.gz"
      sha256 "f57a850845f533c7770d451f7d4cde9dcf8408a27cf77537e3346ca8238fb054"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.6/punq-v1.3.6-darwin-amd64.tar.gz"
      sha256 "424a82b6850c2ef5caf376bb43460a7422cc61bc19b1398788acc016869f6ee1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.6/punq-v1.3.6-linux-amd64.tar.gz"
        sha256 "baba4f03f9b98f183e1810ca6e6bec6ae0ce3a928690a19c22047534532df590"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.6/punq-v1.3.6-linux-386.tar.gz"
        sha256 "95e1d452ddb6e5f0ccf1694c4a630719d011d7c93a0edc52e122d86381120ffb"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.6/punq-v1.3.6-linux-arm64.tar.gz"
        sha256 "fc94082c56bb7312134a66889c09896c452909268f399b9144026f976896e2e5"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.6/punq-v1.3.6-linux-arm.tar.gz"
        sha256 "8b25b929c06b5d7a1920d6d99d7c4550c90c8808495d9661ecdf065540f77515"
      end
    end
  end
  
  version "1.3.6"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.3.6-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.3.6-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.3.6-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.3.6-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.3.6-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.3.6-linux-arm" => "punq"
      end
    end
  end
end
end
