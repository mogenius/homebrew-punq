class Punq < Formula
  desc "View your kubernetes workloads relativly neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.21/punq-1.1.21-darwin-arm64.tar.gz"
      sha256 "f1d5f9510fdb66bb3d6ac008e54dd0ae289a7527b3376404195fc2ae4b2db44c"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.21/punq-1.1.21-darwin-amd64.tar.gz"
      sha256 "952c5d93518298258ff37f24e6d51b64f616ac0e3202f86ac1db77f01e604484"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.21/punq-1.1.21-linux-amd64.tar.gz"
        sha256 "983c57660af2dbfb1be6cf13cd683f330ba64f8a938056c42aa88fb2fc00bbe1"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.21/punq-1.1.21-linux-386.tar.gz"
        sha256 "4b546cc4dd08f0d744cdc995334e0e4c56bf549a152534309b656c37b14a924e"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.21/punq-1.1.21-linux-arm64.tar.gz"
        sha256 "9a4c4476994fc64aa2f0e81be0aeff7fae2c8fb474490b89be505c652dcc86af"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.21/punq-1.1.21-linux-arm.tar.gz"
        sha256 "2b1816e322f79aa0cee76817c9b7e772b1ecf066397193de21a303a6bbc9e9b0"
      end
    end
  end
  
  version "1.1.21"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-1.1.21-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-1.1.21-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-1.1.21-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-1.1.21-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-1.1.21-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-1.1.21-linux-arm" => "punq"
      end
    end
  end
end
end
