class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.6/punq-v1.4.6-darwin-arm64.tar.gz"
      sha256 "b26171b163957fe15a4178e1e01159b29a96bb060662fdf566775c1e2ac4d8fe"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.6/punq-v1.4.6-darwin-amd64.tar.gz"
      sha256 "c270860bdcb3c060f2c3b207255a41529e4f5df958c249337d42e59836af41be"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.6/punq-v1.4.6-linux-amd64.tar.gz"
        sha256 "b7972e7747a492897a1eeab2b8391c8ba055fac2e06b70b890e0b3d0c9f58b6b"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.6/punq-v1.4.6-linux-386.tar.gz"
        sha256 "df9c8b6922a0e382132dcf7e9c396a53b11eb62b1610f1f39d0eab0c6e0e33ac"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.6/punq-v1.4.6-linux-arm64.tar.gz"
        sha256 "f9b05770b0e92e53a059e8c68c36314d6aa8f7943327412cd5f6511082191185"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.6/punq-v1.4.6-linux-arm.tar.gz"
        sha256 "7a7c89b076d1d261a892d260d9dd71b32bd9e76876fe32924e2e0da86787dba1"
      end
    end
  end
  
  version "1.4.6"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.4.6-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.4.6-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.4.6-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.4.6-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.4.6-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.4.6-linux-arm" => "punq"
      end
    end
  end
end
end
