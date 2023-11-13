class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.5/punq-v1.5.5-darwin-arm64.tar.gz"
      sha256 "14b3aad30e9ff7e3899fce5a72dd5142997c82d106c09ecd2d20c068bb4ad58d"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.5/punq-v1.5.5-darwin-amd64.tar.gz"
      sha256 "5a1ac58a58fb5cd2705bb367def502285abbd0176c633949fae932ee8ec4e086"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.5/punq-v1.5.5-linux-amd64.tar.gz"
        sha256 "6ae9ab1d07ce58d2b4d42b585565ab6cbc12ade258cf1a420a5524af79c69d3f"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.5/punq-v1.5.5-linux-386.tar.gz"
        sha256 "f9b36b1f0a1cccf47bb8f5e7d1c0b0d3fa8fd2a53fe0329654921ba5b640a3ac"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.5/punq-v1.5.5-linux-arm64.tar.gz"
        sha256 "e535b2c6cc6cde25fbc48db1bb405653328bcc971f4a25036a338f1d45136950"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.5/punq-v1.5.5-linux-arm.tar.gz"
        sha256 "a1a99626a769a0c127556a9067c34b17722f631de7d4029f43b2af735e5b8c62"
      end
    end
  end
  
  version "1.5.5"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.5.5-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.5.5-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.5.5-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.5.5-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.5.5-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.5.5-linux-arm" => "punq"
      end
    end
  end
end
end
