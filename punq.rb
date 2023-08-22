class Punq < Formula
  desc "View your kubernetes workloads relativly neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.19/punq-1.1.19-darwin-arm64.tar.gz"
      sha256 "e890fdfe2848d112fe07004e456a6857422023588e997858263dd2abd6c43b07"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.19/punq-1.1.19-darwin-amd64.tar.gz"
      sha256 "98edccf81cd464ec41a209aefed10ef5705669e6756be3b105e418a855a45611"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.19/punq-1.1.19-linux-amd64.tar.gz"
        sha256 "bcc44f598cd2a1d756c452ca5f1f842fc4a2a31bc99f198bcb64999914f397a4"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.19/punq-1.1.19-linux-386.tar.gz"
        sha256 "3b76426ddf609123a66438589da8936559f0351853621a726dbecb30b6d2ac75"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.19/punq-1.1.19-linux-arm64.tar.gz"
        sha256 "83cd76ea8b73b93bc4ebd1ec41fc439ee3a07929bb512d2dd097b5e5c0293085"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.19/punq-1.1.19-linux-arm.tar.gz"
        sha256 "3767fd090963436077d6b4481b317a167f485bd25b59869bfc3d50b0221820a7"
      end
    end
  end
  
  version "1.1.19"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-1.1.19-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-1.1.19-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-1.1.19-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-1.1.19-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-1.1.19-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-1.1.19-linux-arm" => "punq"
      end
    end
  end
end
end
