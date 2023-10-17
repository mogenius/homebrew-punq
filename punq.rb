class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.8/punq-v1.4.8-darwin-arm64.tar.gz"
      sha256 "f6eca362ec21d31feada9100f3e14f45b3e5186cb450a4b24e4ef6c34c1b8a4d"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.8/punq-v1.4.8-darwin-amd64.tar.gz"
      sha256 "afc5b05ebb700b3662847cef1ee9e3024bc7fd8e39def6b2ca0d46c0ed2638f4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.8/punq-v1.4.8-linux-amd64.tar.gz"
        sha256 "2c31647d6846ad3a8f04ca1a4d2f0caa8437feae79c69c7c62bff813cc34de5f"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.8/punq-v1.4.8-linux-386.tar.gz"
        sha256 "f7f5a407628852d8220f6af13ff7fdf9d86fffd723f2c7eca16f78d47e73e59b"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.8/punq-v1.4.8-linux-arm64.tar.gz"
        sha256 "9077ac0e05e85d9a542047d3674fb215da38e58bd4f0e2ae4378ef5d965a246e"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.8/punq-v1.4.8-linux-arm.tar.gz"
        sha256 "592db9432bb452876d4abe9740d6441bcc0dc555d088ab7fb7ce7b6434625651"
      end
    end
  end
  
  version "1.4.8"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.4.8-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.4.8-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.4.8-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.4.8-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.4.8-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.4.8-linux-arm" => "punq"
      end
    end
  end
end
end
