class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.36/punq-v1.1.36-darwin-arm64.tar.gz"
      sha256 "f3da4ba22b4bf70ba4e2d880476b8ae8ae35132eb7f997e3514c5f2acc76f2ce"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.36/punq-v1.1.36-darwin-amd64.tar.gz"
      sha256 "398b1b12b52f38c3421427347ca968a878d608206e588d6c531726d3fa42dea0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.36/punq-v1.1.36-linux-amd64.tar.gz"
        sha256 "ff3e2289fa30a55bbda17763e6ab2114409848eabc2f8d09cfbcc8bf2a92bdd1"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.36/punq-v1.1.36-linux-386.tar.gz"
        sha256 "c9672301c93a2793800842740099189593dd081c81b47cf6b1cbacf889f09e66"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.36/punq-v1.1.36-linux-arm64.tar.gz"
        sha256 "67b4943f11c5eca3c6dcb7ad3e1a1e69b44b22b29c1b3b2a0115a3ce2ac23027"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.36/punq-v1.1.36-linux-arm.tar.gz"
        sha256 "05ba92554b5f09ce36fdc23c5bd4e568f146cb8ac421d8ca30c913647c1f84d6"
      end
    end
  end
  
  version ""
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.1.36-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.1.36-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.1.36-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.1.36-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.1.36-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.1.36-linux-arm" => "punq"
      end
    end
  end
end
end
