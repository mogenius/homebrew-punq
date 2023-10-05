class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.3/punq-v1.3.3-darwin-arm64.tar.gz"
      sha256 "c3ced4509e2669069b320edf94976cd40aefcb0f719cc63320c58d2380143fb5"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.3/punq-v1.3.3-darwin-amd64.tar.gz"
      sha256 "c0ab64f3705b078ad2bf702e0264c48c5c1b63adc689cde1388e6604981db093"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.3/punq-v1.3.3-linux-amd64.tar.gz"
        sha256 "2a01a87d088fb858472c0a8ad6a4f67c237a59e4b690fb8bde0b6cd0dba53dbe"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.3/punq-v1.3.3-linux-386.tar.gz"
        sha256 "89ff36daf9120b9775f885ac4daf27fa6de23458260ac7e04c8e1fbcab9a1304"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.3/punq-v1.3.3-linux-arm64.tar.gz"
        sha256 "83ccfb67300dc6f68eb11cfb94c8d7dcae50828564ee03d5f5d42c436ad811b8"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.3/punq-v1.3.3-linux-arm.tar.gz"
        sha256 "db8542fc31d4d41ce3947a23c3de97e050308baccd514a20946526edc7f1ccb5"
      end
    end
  end
  
  version "1.3.3"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.3.3-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.3.3-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.3.3-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.3.3-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.3.3-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.3.3-linux-arm" => "punq"
      end
    end
  end
end
end
