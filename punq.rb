class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.0/punq-v1.2.0-darwin-arm64.tar.gz"
      sha256 "937aa9b2e95117890a817d490ba6c45b74b55d07c130277e50f683c3237f5640"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.0/punq-v1.2.0-darwin-amd64.tar.gz"
      sha256 "7279209e1b82f67549407ef80db0b78c3e5373e844b6c81029102a043d16a243"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.0/punq-v1.2.0-linux-amd64.tar.gz"
        sha256 "4b00159573477d9fd92a7f48e1883e913fe385f645fb24b0726264222aea1951"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.0/punq-v1.2.0-linux-386.tar.gz"
        sha256 "6e77858821b5c411efbb367698afe6971114795c77125eb2ab174b501feb640f"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.0/punq-v1.2.0-linux-arm64.tar.gz"
        sha256 "89eb0ce4d5eb4b1d2b12f7b07da7045547326d5a027fbcc9e1d8f4d26f8fb69e"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.0/punq-v1.2.0-linux-arm.tar.gz"
        sha256 "023a5906f13856fa8f949608c7ea6e2de8b08019ae8f49dfff7f5b96649db8a4"
      end
    end
  end
  
  version "1.2.0"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.0-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.0-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.0-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.0-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.0-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.0-linux-arm" => "punq"
      end
    end
  end
end
end
