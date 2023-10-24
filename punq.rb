class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.9/punq-v1.4.9-darwin-arm64.tar.gz"
      sha256 "a48c38302dedc42e1183d05d3b2b80821a4edb368ecc8990245b5c3395e7d153"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.9/punq-v1.4.9-darwin-amd64.tar.gz"
      sha256 "b53a0d1cfb3b44728442aedccc49e934a4e07b1f82bb5c2c93f535248368e6c3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.9/punq-v1.4.9-linux-amd64.tar.gz"
        sha256 "7de3b9cd9445193997dc19db3b6dabe627b6822fa9666276c656922463a06dba"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.9/punq-v1.4.9-linux-386.tar.gz"
        sha256 "6452ed984a1492b29171789c1c5a16ea11bb5974ddf553d708d639be0a4153fe"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.9/punq-v1.4.9-linux-arm64.tar.gz"
        sha256 "4b6c4f38c30167373626927a94eca731af06924141dcc55320cba6812465ef50"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.9/punq-v1.4.9-linux-arm.tar.gz"
        sha256 "5c4372ed0bee9003a0bbd8104b19db6ccb8b8482692fb5c96a2ec3044d4ed0b2"
      end
    end
  end
  
  version "1.4.9"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.4.9-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.4.9-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.4.9-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.4.9-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.4.9-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.4.9-linux-arm" => "punq"
      end
    end
  end
end
end
