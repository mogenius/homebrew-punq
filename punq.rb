class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.7/punq-v1.5.7-darwin-arm64.tar.gz"
      sha256 "ddb8da162913cd7748ef9b3665bc4a8fcf099183d6005057a7f658240631e61c"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.7/punq-v1.5.7-darwin-amd64.tar.gz"
      sha256 "269728e9f71f32073da9c65ec846baac2877696bb6ef7c7adf00bb49a4cba019"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.7/punq-v1.5.7-linux-amd64.tar.gz"
        sha256 "828908d28fadaa54a0504df697a8dd4ec8561aee7c481a86846ab4f1f27f041b"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.7/punq-v1.5.7-linux-386.tar.gz"
        sha256 "39d1ddf5ca13ebff40bc37f8ed95f3504c2ea32aedd36735175d4ff53b2e81a9"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.7/punq-v1.5.7-linux-arm64.tar.gz"
        sha256 "6c70e4cea5a47f4e7c447d0fccdd370788155606d81ad8139819bbe36e7b7a67"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.7/punq-v1.5.7-linux-arm.tar.gz"
        sha256 "25670329fe0cd660e26786bca2cdc65f89febd9846fd32e163242aa182c87c16"
      end
    end
  end
  
  version "1.5.7"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.5.7-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.5.7-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.5.7-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.5.7-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.5.7-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.5.7-linux-arm" => "punq"
      end
    end
  end
end
end
