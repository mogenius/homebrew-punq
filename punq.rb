class Punq < Formula
  desc "View your kubernetes workloads relativly neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.20/punq-1.1.20-darwin-arm64.tar.gz"
      sha256 "30fbedd49e8d1b374cd48707c7fd41b632093bffb64a0ebed064426083f718e6"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.20/punq-1.1.20-darwin-amd64.tar.gz"
      sha256 "2fc97e5fa7a237f65bbf30f0818813a6327dbfe2af8e19fa2a2ba08a05ebd4fd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.20/punq-1.1.20-linux-amd64.tar.gz"
        sha256 "8bf9c6d754e54c6baa25b63277b58e8332649cf03f09722ca42d97083cd4740a"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.20/punq-1.1.20-linux-386.tar.gz"
        sha256 "40c93ae0861b4786915c04e46d69001da2726cf3feec124031caa049403b7c06"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.20/punq-1.1.20-linux-arm64.tar.gz"
        sha256 "09c9cd5773585ebda871b247c68eba012fdd95812cefa5de7d5ef24a3f4efd22"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.20/punq-1.1.20-linux-arm.tar.gz"
        sha256 "c1e8365357c6eea8fcb09433525fc6461d70c4c7a9a8dfcdd7970db2e6ea02a2"
      end
    end
  end
  
  version "1.1.20"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-1.1.20-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-1.1.20-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-1.1.20-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-1.1.20-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-1.1.20-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-1.1.20-linux-arm" => "punq"
      end
    end
  end
end
end
