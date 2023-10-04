class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.0/punq-v1.3.0-darwin-arm64.tar.gz"
      sha256 "fe37a727c6142032dd93d59c88e53c9bf756e22d3e4eda73899ab59fd360fa66"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.0/punq-v1.3.0-darwin-amd64.tar.gz"
      sha256 "de716ff0e1ac99c4ebbb70bc67449e48f3288d15bb11f70cdcf8a54b2b540fd4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.0/punq-v1.3.0-linux-amd64.tar.gz"
        sha256 "044cd1a30701eca8a162378b3a97acbb7f4b0a31e7f87b2131d00214d6cb3559"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.0/punq-v1.3.0-linux-386.tar.gz"
        sha256 "92e86e81bd3509d65edbdabade160d5d0270cf8f73a423aa69a5766d38674864"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.0/punq-v1.3.0-linux-arm64.tar.gz"
        sha256 "0f6db30a874e62debca104ad824dd45062faeffc9a0f4cba6d75643499ed7d13"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.0/punq-v1.3.0-linux-arm.tar.gz"
        sha256 "e8d3e5aee6f0cccf6debd877c51983ab67cd9998c1d6ba69d09429505009899c"
      end
    end
  end
  
  version "1.3.0"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.3.0-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.3.0-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.3.0-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.3.0-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.3.0-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.3.0-linux-arm" => "punq"
      end
    end
  end
end
end
