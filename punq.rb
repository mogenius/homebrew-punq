class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.12/punq-v1.2.12-darwin-arm64.tar.gz"
      sha256 "c0d6117d50bcf9081d7ebc52754bf8a90136da268e3ae3185c9e9ff26a0febc1"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.12/punq-v1.2.12-darwin-amd64.tar.gz"
      sha256 "2ac1f45b20478e65c636027440b55d3782663db2980d4c33d97a02f441b5d36c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.12/punq-v1.2.12-linux-amd64.tar.gz"
        sha256 "6c2618c0f02bc15fbe1ecb29f476dd282c1f0a828e3fe3bfbc3d3fa31b813382"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.12/punq-v1.2.12-linux-386.tar.gz"
        sha256 "c6c09a1390727e995002c4e06495b5c2e9a5c191188da80a08c3a81a871cbb8b"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.12/punq-v1.2.12-linux-arm64.tar.gz"
        sha256 "6b96404fe3446fdbca100fefb303be179c25fc3d70650697605ff797b140f58c"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.12/punq-v1.2.12-linux-arm.tar.gz"
        sha256 "62a8ab1cccd170832f11e9fa3ab557dbde5d21a952e4bc8894e279223ac19956"
      end
    end
  end
  
  version "1.2.12"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.12-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.12-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.12-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.12-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.12-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.12-linux-arm" => "punq"
      end
    end
  end
end
end
