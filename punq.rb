class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.22/punq-v1.2.22-darwin-arm64.tar.gz"
      sha256 "cd65cf7d966924459df2e0d2be849d58719248df6540df0f36bfe610c35ee4b6"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.22/punq-v1.2.22-darwin-amd64.tar.gz"
      sha256 "1f07517b156ef0bd539de4a28f97a46ce8ee0b36bc61c9043f2ce7fc41c3d8c3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.22/punq-v1.2.22-linux-amd64.tar.gz"
        sha256 "384ba6bfa29d4463a78d65f256c7901efa00fb3970f5dfe43c0239c96271e810"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.22/punq-v1.2.22-linux-386.tar.gz"
        sha256 "ddc3616bf3cbbcc3a743587c41c044d610b960a595809ec19486f659113ab182"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.22/punq-v1.2.22-linux-arm64.tar.gz"
        sha256 "0315011d57db237becae601d928a545f9ce895021efe0a4b947893c0073b406c"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.22/punq-v1.2.22-linux-arm.tar.gz"
        sha256 "30f4e08c1e1970eaa1c41e1acd42f9c99541887b0d06db27e5c0b1a8e0d01201"
      end
    end
  end
  
  version "1.2.22"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.22-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.22-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.22-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.22-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.22-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.22-linux-arm" => "punq"
      end
    end
  end
end
end
