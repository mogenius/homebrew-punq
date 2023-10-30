class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.0/punq-v1.5.0-darwin-arm64.tar.gz"
      sha256 "795b92ba71045ca3d54d1d676a3164fcda3d77cce7122a496b24a6113b9355b9"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.0/punq-v1.5.0-darwin-amd64.tar.gz"
      sha256 "05050a858f53d38ba8c369081dea8bf384ffd0fd162bc15dc3b59099de26175d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.0/punq-v1.5.0-linux-amd64.tar.gz"
        sha256 "dd6cac77e5eff90d8cb47515cb8f7f92c3168866ba584c12f423dd7c2f344e0d"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.0/punq-v1.5.0-linux-386.tar.gz"
        sha256 "65395aa2b020d1956bc3beed1d5c00d66f06962bbb30161c502365811abe9421"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.0/punq-v1.5.0-linux-arm64.tar.gz"
        sha256 "1b8fe6bfbdb88642fe13075bc264c21f74993800b67539251c1f978732845ef5"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.0/punq-v1.5.0-linux-arm.tar.gz"
        sha256 "ff4ad300384c82e0ad930f1042b114a60bf764cd63dd4fba668e23e239392e4f"
      end
    end
  end
  
  version "1.5.0"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.5.0-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.5.0-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.5.0-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.5.0-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.5.0-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.5.0-linux-arm" => "punq"
      end
    end
  end
end
end
