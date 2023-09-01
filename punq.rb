class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.40/punq-v1.1.40-darwin-arm64.tar.gz"
      sha256 "395a530b68334abff5af2e7f64cc19de36cc16b16d537ed9753ce058f7a4c40c"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.40/punq-v1.1.40-darwin-amd64.tar.gz"
      sha256 "a990822531c9e964eb3196e00ab40a35d1876c9b1bc0aeff30249c572453c647"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.40/punq-v1.1.40-linux-amd64.tar.gz"
        sha256 "572c6af925abc3ea8fdc332e85f81b0a1e71d53281b86f1c7041bd93d461a95c"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.40/punq-v1.1.40-linux-386.tar.gz"
        sha256 "8be55a13d4f109d9b0efae77559c66056d6baf6ab3e7a85bef38f59fd77f8a93"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.40/punq-v1.1.40-linux-arm64.tar.gz"
        sha256 "d7d2b5f0fc469680c7cfc61de66ec627cb83ed075bcb4a795d58155017d01ecb"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.40/punq-v1.1.40-linux-arm.tar.gz"
        sha256 "c85735a2b85e62c50dde64998e9dfff3ad663a77a3012a561c759f83ddf9c7b0"
      end
    end
  end
  
  version "1.1.40"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.1.40-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.1.40-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.1.40-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.1.40-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.1.40-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.1.40-linux-arm" => "punq"
      end
    end
  end
end
end
