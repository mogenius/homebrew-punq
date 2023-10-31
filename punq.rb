class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.1/punq-v1.5.1-darwin-arm64.tar.gz"
      sha256 "015ed36e21a4b8d048db285829b700348752afec426f30dde864a752db2af440"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.1/punq-v1.5.1-darwin-amd64.tar.gz"
      sha256 "220c55ca6a133b49ad574ec111eb444fb8a8085a7b574d79e5c1b1a5b4619d1c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.1/punq-v1.5.1-linux-amd64.tar.gz"
        sha256 "d23f09d213d3fb17a265e6d1145568cebe3b1ac6bac8833c5c76810d824a4a3e"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.1/punq-v1.5.1-linux-386.tar.gz"
        sha256 "35fd5e204da5f213d1d68cffef8cda03ab7605ba4a08a6d29f649443ebf21af5"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.1/punq-v1.5.1-linux-arm64.tar.gz"
        sha256 "a5eb69e97734ce35baa185057e08ea35e5f45cd9e6f3380af4aa67fb243ffbfe"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.1/punq-v1.5.1-linux-arm.tar.gz"
        sha256 "ab2bd8fc1705742d29e736cb180e28df02794e7c4359da919dcd4df1e3150507"
      end
    end
  end
  
  version "1.5.1"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.5.1-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.5.1-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.5.1-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.5.1-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.5.1-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.5.1-linux-arm" => "punq"
      end
    end
  end
end
end
