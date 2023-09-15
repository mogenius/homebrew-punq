class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.9/punq-v1.2.9-darwin-arm64.tar.gz"
      sha256 "24bd161595de019974f1b1da3189e80c10109287732a06784e615df9cd08fb6c"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.9/punq-v1.2.9-darwin-amd64.tar.gz"
      sha256 "754b131d5cde608c5d3594274067e300af059b9f8b1bfebea08d4abe3ca2c2a3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.9/punq-v1.2.9-linux-amd64.tar.gz"
        sha256 "bb4469c5591d4ba4e8d40b2c7cfc7949b99adb2b98a68a525dbfc324fa84c379"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.9/punq-v1.2.9-linux-386.tar.gz"
        sha256 "16d19a147702b10885103a3fa54155b963be62f9a2ae8b46fad0aa58b1fd7aa4"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.9/punq-v1.2.9-linux-arm64.tar.gz"
        sha256 "6f29fa2961bf937677ed3d1f740ab89fca4fef4675a98d2a1d0e594dbea34ee8"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.9/punq-v1.2.9-linux-arm.tar.gz"
        sha256 "b10f153487f166cf5f06c2ffcc3a92c3d9b1cd84fa7915f8176b8eb7802dba32"
      end
    end
  end
  
  version "1.2.9"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.9-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.9-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.9-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.9-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.9-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.9-linux-arm" => "punq"
      end
    end
  end
end
end
