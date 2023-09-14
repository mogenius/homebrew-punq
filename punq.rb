class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.1/punq-v1.2.1-darwin-arm64.tar.gz"
      sha256 "7c4c4dd346970e590ac1334d0bec3474667b0533efeb18378ce5158aea1cc0e4"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.1/punq-v1.2.1-darwin-amd64.tar.gz"
      sha256 "ca9d800e05214edb34523fc6d9fe0fb71f31c5b8359b52f6fbd91f83426b93a8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.1/punq-v1.2.1-linux-amd64.tar.gz"
        sha256 "a1657cefd059a5fbe2cd09482732123d72aee7193560ff07b6e23cdc4fcf543a"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.1/punq-v1.2.1-linux-386.tar.gz"
        sha256 "e7c3bb4c92b4d5a6988d702af119dc92d6c7e1d858014960353e583d12994e2f"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.1/punq-v1.2.1-linux-arm64.tar.gz"
        sha256 "f192db64a40d3c29c75700e375116c801e94553743e53f90a3e988f9170d359c"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.1/punq-v1.2.1-linux-arm.tar.gz"
        sha256 "f8684a8074a8347da3392718cca70a414ab2822564090487865c81a80645824d"
      end
    end
  end
  
  version "1.2.1"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.1-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.1-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.1-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.1-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.1-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.1-linux-arm" => "punq"
      end
    end
  end
end
end
