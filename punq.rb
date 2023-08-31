class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.35/punq-v1.1.35-darwin-arm64.tar.gz"
      sha256 "9feb8a1f0472414e1d4e2b2bb9c8ee713b1cdeb7d43d646d23eacd524f251300"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.35/punq-v1.1.35-darwin-amd64.tar.gz"
      sha256 "735ac01ce2f1e9aa375ae79194ed0199a1ba8d30b9c52841bcb592b38df04e45"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.35/punq-v1.1.35-linux-amd64.tar.gz"
        sha256 "0e423c0b38cb61d08f0036ff5d056071ae15b9c7fe52722e3bd126de993f83a2"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.35/punq-v1.1.35-linux-386.tar.gz"
        sha256 "e90209978b45e41d7b033b082858c93f4d25bf82d2cf26f63fcb9187ec9ef763"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.35/punq-v1.1.35-linux-arm64.tar.gz"
        sha256 "00144631bad0f3db0b2927dd4934bc74b2cffc6d5b8412ff7ee35450d2a1fa4e"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.35/punq-v1.1.35-linux-arm.tar.gz"
        sha256 "be2b296f565c80e6fab548893fda93583aced805f51f4b64c47b72f81776f978"
      end
    end
  end
  
  version ""
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.1.35-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.1.35-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.1.35-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.1.35-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.1.35-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.1.35-linux-arm" => "punq"
      end
    end
  end
end
end
