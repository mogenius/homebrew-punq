class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.20/punq-v1.2.20-darwin-arm64.tar.gz"
      sha256 "affa1afe78d2f29196b284e323a5baf64ead165288c544e4be7095145767676a"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.20/punq-v1.2.20-darwin-amd64.tar.gz"
      sha256 "d66db86f2632727af2dceb343f853e725759fcedb2d7e65ce575356e0cb44c30"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.20/punq-v1.2.20-linux-amd64.tar.gz"
        sha256 "2030c28ca9b49452e208726431394100111d15ab1d6d84dbd50ffa4983efdad8"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.20/punq-v1.2.20-linux-386.tar.gz"
        sha256 "1ac5102fc140db7087ceefd5abb7443f542a48f9d8a22656bbec80cbbde79123"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.20/punq-v1.2.20-linux-arm64.tar.gz"
        sha256 "8cd96f5fa64c74e732be4029c630f64e1f84baea6e29d6f7e39aeab9ff71e801"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.20/punq-v1.2.20-linux-arm.tar.gz"
        sha256 "84e4d301991a76cd20abff13b6f2f47702cef3fa67f75f5bee058db3ab83d857"
      end
    end
  end
  
  version "1.2.20"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.20-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.20-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.20-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.20-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.20-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.20-linux-arm" => "punq"
      end
    end
  end
end
end
