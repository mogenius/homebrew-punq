class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.30/punq-v1.1.30-darwin-arm64.tar.gz"
      sha256 "a791a4dcc723a3e793e9f5c79176cd49935f1209941e327899db5a3c23202f70"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.30/punq-v1.1.30-darwin-amd64.tar.gz"
      sha256 "37bb32c50781ddacaa760b6b3915d9c5dcd7b809fe022232c40cdeedf3f3aefe"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.30/punq-v1.1.30-linux-amd64.tar.gz"
        sha256 "8527a10de6dde9902427beb561976552c2f643eba00c6c3574afefc41de57e11"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.30/punq-v1.1.30-linux-386.tar.gz"
        sha256 "a43e443ff91e0c827e2ff2482ca3d29685f0928a90a131d161e926c88e8077db"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.30/punq-v1.1.30-linux-arm64.tar.gz"
        sha256 "cdbf3d94ba28d6ef232b5a8c18da178c2eb583130df442a8cd6952c9cd3d4b0c"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.30/punq-v1.1.30-linux-arm.tar.gz"
        sha256 "26c87fd419fc08a2cc11f6446d66bd627e1b26db09154a9e1b8c510b51147383"
      end
    end
  end
  
  version ""
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.1.30-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.1.30-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.1.30-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.1.30-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.1.30-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.1.30-linux-arm" => "punq"
      end
    end
  end
end
end
