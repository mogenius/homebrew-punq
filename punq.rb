class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.7/punq-v1.2.7-darwin-arm64.tar.gz"
      sha256 "fe8b19289cb2ccfecff6a8f36a28fd1fedc61d24d4ef7f29c861aa6c734885bf"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.7/punq-v1.2.7-darwin-amd64.tar.gz"
      sha256 "1ee0efe51d07862bcda6704bca06476771dcb9a7215e0c609de55e8327f672fb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.7/punq-v1.2.7-linux-amd64.tar.gz"
        sha256 "06e5f834426577bb4f1e3c0127159d8e6cce7d30c958cd6a882dcd61d8a12dca"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.7/punq-v1.2.7-linux-386.tar.gz"
        sha256 "e1359cddafaae87107d8b87630a8b30628d82c795e1535428a681244c8349d67"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.7/punq-v1.2.7-linux-arm64.tar.gz"
        sha256 "6832c92de76aa0f875b4176f044cd0ebc2a747dc4029cf986889886fc68dc4ce"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.7/punq-v1.2.7-linux-arm.tar.gz"
        sha256 "c11360383f11238a1b7d73839f27673876f74910ad0bca69a8e01977a67892d2"
      end
    end
  end
  
  version "1.2.7"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.7-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.7-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.7-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.7-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.7-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.7-linux-arm" => "punq"
      end
    end
  end
end
end
