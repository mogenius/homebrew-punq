class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.11/punq-v1.2.11-darwin-arm64.tar.gz"
      sha256 "79dfb002d34351710165064294979e32233654f9317722646d1b10c0c31fd509"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.11/punq-v1.2.11-darwin-amd64.tar.gz"
      sha256 "58dc5c7234f81604d49e112e3aafa109ecc2eee1b4799dfa32ba41d72b8f3826"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.11/punq-v1.2.11-linux-amd64.tar.gz"
        sha256 "1e52fc3ce3bded1a9c2a86687bfe2cb430bfda4883d5a64a2bff3ccfde8f6d29"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.11/punq-v1.2.11-linux-386.tar.gz"
        sha256 "4d434e0cd88c821d9cf6d16aed403dbb5eeb697638c16773a212f25122359fb5"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.11/punq-v1.2.11-linux-arm64.tar.gz"
        sha256 "3dce5fad8087eb2053d74b86d215de09bcfb12a1b736cda071d8110fb229610c"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.11/punq-v1.2.11-linux-arm.tar.gz"
        sha256 "9ac3432ffb5e7b59be15f9b8770b2b908a4307ec438ad87c9dd4c2fd889ff5b6"
      end
    end
  end
  
  version "1.2.11"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.11-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.11-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.11-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.11-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.11-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.11-linux-arm" => "punq"
      end
    end
  end
end
end
