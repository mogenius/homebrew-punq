class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.18/punq-v1.2.18-darwin-arm64.tar.gz"
      sha256 "4f54ad64ce8267aa1b23003389beaccf83539765d2b3f716f7a51406f0c0e591"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.18/punq-v1.2.18-darwin-amd64.tar.gz"
      sha256 "5ea4e886caf514e3f28a271fcf725e4398d8c9ac977fd7f99421357a30e8fb62"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.18/punq-v1.2.18-linux-amd64.tar.gz"
        sha256 "aa724bd8575918d047a96a7927ec229996119aafe8cad59acdbb5c2a2d938854"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.18/punq-v1.2.18-linux-386.tar.gz"
        sha256 "af2a437f4c463ecb1efa41e5ae580ac2875f2788fd1983f1f43a69da337ce4be"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.18/punq-v1.2.18-linux-arm64.tar.gz"
        sha256 "4b2e73236ee0ad96e4670681f758714a486275235e69121a9201a67b5f0a45f3"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.18/punq-v1.2.18-linux-arm.tar.gz"
        sha256 "73c331ef9c1840e9d8e8014d4eb222ed717b8e1d820b0b2abfe8e0ef300a19fa"
      end
    end
  end
  
  version "1.2.18"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.18-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.18-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.18-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.18-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.18-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.18-linux-arm" => "punq"
      end
    end
  end
end
end
