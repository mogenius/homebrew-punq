class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.5/punq-v1.4.5-darwin-arm64.tar.gz"
      sha256 "f8f61691a112ee75c44c418a8245e7fb5b9b53c0b634b493d3a28731c49fd0b2"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.5/punq-v1.4.5-darwin-amd64.tar.gz"
      sha256 "8987e4eccaf7c77c4c4e5587c44a7d1e05cb6ddf2e4fc08b57e41c001ff45a4b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.5/punq-v1.4.5-linux-amd64.tar.gz"
        sha256 "a23d966c8d190003cd69d033a6e263421ac213402dcf2fd234de3f290238a5e7"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.5/punq-v1.4.5-linux-386.tar.gz"
        sha256 "3686bbc047e1150030a6082cc3c3398226933607516b3c8c4260e5e2d48f5a03"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.5/punq-v1.4.5-linux-arm64.tar.gz"
        sha256 "1b9aa33086b553cee6524ebf7f1e02cf29583c042feb1504135445445dab1d9d"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.5/punq-v1.4.5-linux-arm.tar.gz"
        sha256 "8a96a34ad1b8837111c07459df0cf8e902264480a57c76881e2c887c0f90c9a2"
      end
    end
  end
  
  version "1.4.5"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.4.5-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.4.5-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.4.5-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.4.5-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.4.5-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.4.5-linux-arm" => "punq"
      end
    end
  end
end
end
