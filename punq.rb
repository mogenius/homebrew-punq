class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.7/punq-v1.3.7-darwin-arm64.tar.gz"
      sha256 "9903511ddaafc925c8578333a7e03cc9395e930f5819ac8c28dbc97e3af423d8"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.7/punq-v1.3.7-darwin-amd64.tar.gz"
      sha256 "c63bcddf7e43a647b90fda87829e565e9911e77b8d28d0825a20d7cff01cec57"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.7/punq-v1.3.7-linux-amd64.tar.gz"
        sha256 "22cab37b293a5cf0eeaacbe4f2020b9f60c9f6022dd7c9a50e797c7b62c3f663"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.7/punq-v1.3.7-linux-386.tar.gz"
        sha256 "03b36a9c7d250695a2a9cb2bb4d9feed4568d2d513c220e79880831ed13fbaff"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.7/punq-v1.3.7-linux-arm64.tar.gz"
        sha256 "4cb8c6cd4991b3bdaef82c1525617bc581d84b8c93f6873194ac41f74c8633ae"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.7/punq-v1.3.7-linux-arm.tar.gz"
        sha256 "b36c7d59f3892114d1cf5f0668cd7638837cc01e98a82f7df8e5078fabd93c74"
      end
    end
  end
  
  version "1.3.7"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.3.7-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.3.7-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.3.7-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.3.7-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.3.7-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.3.7-linux-arm" => "punq"
      end
    end
  end
end
end
