class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.5/punq-v1.3.5-darwin-arm64.tar.gz"
      sha256 "bd4542a10049ac2cdc069506c54521913d0b934571ee75586d2d7b168a419f04"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.5/punq-v1.3.5-darwin-amd64.tar.gz"
      sha256 "9489a8c2696053ade21cdb4b4e5880d14ddd81ed5696e059b20092fcc080ba29"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.5/punq-v1.3.5-linux-amd64.tar.gz"
        sha256 "fbd3474f7eca86101b6239732a05ee5f562d31b8b95d7e47332f07a2c65ec4df"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.5/punq-v1.3.5-linux-386.tar.gz"
        sha256 "943029faac31ee13061990d2604704a5bb2454538183f00751fa8b803d75ca37"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.5/punq-v1.3.5-linux-arm64.tar.gz"
        sha256 "06af586755b403c632c018bf9c4dd340c8e16e07c865a3595168241a3573f7a9"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.5/punq-v1.3.5-linux-arm.tar.gz"
        sha256 "acd30bfe66e566eea504802194f8c12043acf05a44ddcc4105a36e0752fb9e17"
      end
    end
  end
  
  version "1.3.5"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.3.5-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.3.5-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.3.5-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.3.5-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.3.5-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.3.5-linux-arm" => "punq"
      end
    end
  end
end
end
