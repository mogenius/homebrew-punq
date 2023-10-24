class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.10/punq-v1.4.10-darwin-arm64.tar.gz"
      sha256 "9efe10384c14a716ad356bc49a70a1580043fc310cbd53a645e6d44e56e80328"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.10/punq-v1.4.10-darwin-amd64.tar.gz"
      sha256 "d8b567cb879f592d882fc2dd3c2ab03f085aceb3afa3958fc6210c59b1d4643f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.10/punq-v1.4.10-linux-amd64.tar.gz"
        sha256 "6da0afb62e2b3093265e6eaedbeba29b63bd3b1a1e12fbd571172a6f5eb72f85"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.10/punq-v1.4.10-linux-386.tar.gz"
        sha256 "b7e43f3fab4920168a04c412369bf4b1533f59bbea4a97c1b8771ee4a2209389"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.10/punq-v1.4.10-linux-arm64.tar.gz"
        sha256 "0e3d25a336c86381066092e8c3ef67cd6c2975cb4ccd5f7d7733b13859c77800"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.10/punq-v1.4.10-linux-arm.tar.gz"
        sha256 "5cfd249af9669cd39986f5af05f2850063704dce461b0dffed8485b2b5b6fead"
      end
    end
  end
  
  version "1.4.10"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.4.10-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.4.10-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.4.10-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.4.10-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.4.10-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.4.10-linux-arm" => "punq"
      end
    end
  end
end
end
