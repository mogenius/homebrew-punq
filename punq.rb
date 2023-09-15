class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.6/punq-v1.2.6-darwin-arm64.tar.gz"
      sha256 "043c3e0c7433da0deae35cf9929e72b59751e0976074d4b403da2b4c002ee5a9"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.6/punq-v1.2.6-darwin-amd64.tar.gz"
      sha256 "ca880df7f92d3691d62d888bb833489e38af628f95b5c2ede75ca4937bc29066"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.6/punq-v1.2.6-linux-amd64.tar.gz"
        sha256 "73d15bdf48769f162ae3ff1856fffe996d27faab86e6d38486f093ec118ed889"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.6/punq-v1.2.6-linux-386.tar.gz"
        sha256 "762d616459bebc4736c4769323a830f867ff80644ca3cc1f21b5ac9137298ef6"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.6/punq-v1.2.6-linux-arm64.tar.gz"
        sha256 "23b2f436514ef4f3a9f35d0a63694823a5127c402f12f79d55e6527f22b387ff"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.6/punq-v1.2.6-linux-arm.tar.gz"
        sha256 "00887cccb115434935bec43b4be634544f3c218477d606ca50ab2fc2a4f750d4"
      end
    end
  end
  
  version "1.2.6"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.6-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.6-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.6-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.6-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.6-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.6-linux-arm" => "punq"
      end
    end
  end
end
end
