class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.4/punq-v1.4.4-darwin-arm64.tar.gz"
      sha256 "7a5d838279106c15042840e7d74b0204e12a96adacc30e791343a4e6fef232f6"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.4/punq-v1.4.4-darwin-amd64.tar.gz"
      sha256 "0ab50a5caeab6d3c6e6d17628067f461498e4d6c051cecbcb9d3e89260da9947"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.4/punq-v1.4.4-linux-amd64.tar.gz"
        sha256 "5b4bbe9e184c2f22cb0c991db32a2f6228e600a697f5102fc6949b769fffb704"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.4/punq-v1.4.4-linux-386.tar.gz"
        sha256 "1260ce8f32fc77a859ba96a6285a146778a80e8af198af074a6eb5930c288085"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.4/punq-v1.4.4-linux-arm64.tar.gz"
        sha256 "5cae89f9a0275e35b93ba41c33808568a6d94b50672b77c5e28aaa137ed7f2b9"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.4/punq-v1.4.4-linux-arm.tar.gz"
        sha256 "b720d3bc0d0e526e2ce989d44a6829164a9c76811efd5b2872d90a4de15604c0"
      end
    end
  end
  
  version "1.4.4"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.4.4-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.4.4-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.4.4-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.4.4-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.4.4-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.4.4-linux-arm" => "punq"
      end
    end
  end
end
end
