class Punq < Formula
  desc "View your kubernetes workloads relativly neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.3/punq-1.1.3-darwin-arm64.tar.gz"
      sha256 "a778053a74d3faa3aaf4ef59ba37d298403ffa365878f34cb95b99a8296ddc3d"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.3/punq-1.1.3-darwin-amd64.tar.gz"
      sha256 "cb8f8d771e9edb61901109dad2c1e211f0e586ee2cea8583b4e603ce8437ed7b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.3/punq-1.1.3-linux-amd64.tar.gz"
        sha256 "ee95134ca8891ed3209eea8cb973ea65aebc97d7cdafd0a9fe5b9a910a1eb390"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.3/punq-1.1.3-linux-386.tar.gz"
        sha256 "02fe886ed9a766599ab0d959239ca466ebf181b4bfa47a6756a8bc102ffb5edb"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.3/punq-1.1.3-linux-arm64.tar.gz"
        sha256 "90030ade9d5491b818a885c916b66af9ee998de88a5fc020ee6cc2c1291da9c6"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.3/punq-1.1.3-linux-arm.tar.gz"
        sha256 "72ed90b91665bbc90b867160e8f5208b545dc295f01b0afda905876718060b24"
      end
    end
  end
  
  version "1.1.3"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-1.1.3-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-1.1.3-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-1.1.3-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-1.1.3-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-1.1.3-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-1.1.3-linux-arm" => "punq"
      end
    end
  end
end
end
