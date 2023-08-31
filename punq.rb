class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.34/punq-v1.1.34-darwin-arm64.tar.gz"
      sha256 "0b191a9474dee671a07b029f74575467b68c67746962173a211d771d3557a82f"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.34/punq-v1.1.34-darwin-amd64.tar.gz"
      sha256 "9c855691acb019b9ce7271c8afb48f24bd7c464b3cf43d1058f0d337f2452457"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.34/punq-v1.1.34-linux-amd64.tar.gz"
        sha256 "06bb2ff3231e676c519f7d21aab206852bdb445c13a74718b894c5fed166a5e7"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.34/punq-v1.1.34-linux-386.tar.gz"
        sha256 "3cb3f0a11f88983a569a2dc007abae2a922d6d5993744e511a7bd3cb1bcd38b1"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.34/punq-v1.1.34-linux-arm64.tar.gz"
        sha256 "763b05f5e130e3dbd7817d43c7c714b0635476456b93584c140bf561efe4784c"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.34/punq-v1.1.34-linux-arm.tar.gz"
        sha256 "cc70d60c1d68d893ed58ddea693e6cb6690784bf30406c5433bd244160a6f9a4"
      end
    end
  end
  
  version ""
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.1.34-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.1.34-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.1.34-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.1.34-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.1.34-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.1.34-linux-arm" => "punq"
      end
    end
  end
end
end
