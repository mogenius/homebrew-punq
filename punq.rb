class Punq < Formula
  desc "View your kubernetes workloads relativly neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.23/punq-1.1.23-darwin-arm64.tar.gz"
      sha256 "35611b50290fa730037acfac0de1e588a04aafeeaf4c27d90e303e353d645d30"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.23/punq-1.1.23-darwin-amd64.tar.gz"
      sha256 "5c3b37cf2deb56fe4fada49f95ddadbc06b512e37ab7aeba160859d64ced3e03"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.23/punq-1.1.23-linux-amd64.tar.gz"
        sha256 "31350d8d4c991dad66a78a42ca1c9c4dda68f5484828574e50110349154ca0a4"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.23/punq-1.1.23-linux-386.tar.gz"
        sha256 "069677c09d835ee5525776f003a3bc10af0f7f6d9e7586bb26d74d0e3bae76ae"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.23/punq-1.1.23-linux-arm64.tar.gz"
        sha256 "f04ae46db4d399b43868bac94648cad3468563fac11d82839d7af44b5caa2656"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.23/punq-1.1.23-linux-arm.tar.gz"
        sha256 "a8bf73e943caf8cc76067b3e37724968165168fec9fee323aee71176678b0f40"
      end
    end
  end
  
  version "1.1.23"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-1.1.23-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-1.1.23-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-1.1.23-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-1.1.23-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-1.1.23-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-1.1.23-linux-arm" => "punq"
      end
    end
  end
end
end
