class Punq < Formula
  desc "View your kubernetes workloads relativly neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.29/punq-v1.1.29-darwin-arm64.tar.gz"
      sha256 "f3a8643f0af05b5c7835191c61353c826ce84fd45ff783e9bbee2a0e9a83305f"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.29/punq-v1.1.29-darwin-amd64.tar.gz"
      sha256 "c834b78d4e1e60d093421559d78ab139efe082cc0a30a619303c3e7e9d1a2d59"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.29/punq-v1.1.29-linux-amd64.tar.gz"
        sha256 "99babf8687913a6f660146b33b906967cf311068e0463632249a3e10e2f24df3"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.29/punq-v1.1.29-linux-386.tar.gz"
        sha256 "7fdecbfc44b220bc6463536daa0cd5fd5aaf8ceaf1017f2f23d7333d407fe223"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.29/punq-v1.1.29-linux-arm64.tar.gz"
        sha256 "acdbd5f9655b899ecb911d027cb2e3d4ef82bb2a716636d2be7b79518cc03886"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.29/punq-v1.1.29-linux-arm.tar.gz"
        sha256 "26722bf0e3f0390ccb29df7b828d131097e98ba39cd2c15e099c17bc67d4ecd4"
      end
    end
  end
  
  version "v1.1.29"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.1.29-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.1.29-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.1.29-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.1.29-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.1.29-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.1.29-linux-arm" => "punq"
      end
    end
  end
end
end
