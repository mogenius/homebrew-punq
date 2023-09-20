class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.36/punq-v1.2.36-darwin-arm64.tar.gz"
      sha256 "f500eaf70ada521801492b8e5cbec27fc14a083d127191076bbfb86708ca87bf"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.36/punq-v1.2.36-darwin-amd64.tar.gz"
      sha256 "4c93d83dd09cdd1ee30a84ee0d5564c4644d96d74b3ca64cd199fdc80dde4100"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.36/punq-v1.2.36-linux-amd64.tar.gz"
        sha256 "a3aedba3e51b1718c722a51480fbe254e1232059afda84878101dc5bf344a8d5"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.36/punq-v1.2.36-linux-386.tar.gz"
        sha256 "b93ad9baa3e689597b32c40db45e811250bef752c61686da20fd26a74d9298e0"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.36/punq-v1.2.36-linux-arm64.tar.gz"
        sha256 "78c7938f879ddb391882a79cb4d582438df2a4a3d5bce618d57ff4d67f3b6608"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.36/punq-v1.2.36-linux-arm.tar.gz"
        sha256 "7995fca0b4ec0501fa6f6899092bcc64fc14fb53fdf3316b21d3f63faa5072bf"
      end
    end
  end
  
  version "1.2.36"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.36-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.36-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.36-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.36-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.36-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.36-linux-arm" => "punq"
      end
    end
  end
end
end
