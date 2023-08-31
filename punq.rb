class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.31/punq-v1.1.31-darwin-arm64.tar.gz"
      sha256 "7f56785ba6ec8c7728b9830c3b1fc10c2e0b7c26a634266a5434f57c690dbc25"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.31/punq-v1.1.31-darwin-amd64.tar.gz"
      sha256 "3670e44335f6e7d34d409a8dd284cdd4a95fb162d30ce4be37e68e8d2196949b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.31/punq-v1.1.31-linux-amd64.tar.gz"
        sha256 "b9a8ee5dc0c6d17d90b636e9c4e829b34b5cef08b6cd75d28be7dfaf0884f369"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.31/punq-v1.1.31-linux-386.tar.gz"
        sha256 "abd81d66f9ab5ad504f6aecc178fceb3db1c36ee8fd43abdf2af8d445be37ac7"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.31/punq-v1.1.31-linux-arm64.tar.gz"
        sha256 "167dd51b989cf9e94f69717b6aa963978f6779f77eed5cc7c8255e6932e5aafb"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.31/punq-v1.1.31-linux-arm.tar.gz"
        sha256 "b44c6a5ab084bf9596f248526d98e8b09be779f8c36b7a6f7968a2bf797f4b50"
      end
    end
  end
  
  version ""
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.1.31-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.1.31-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.1.31-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.1.31-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.1.31-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.1.31-linux-arm" => "punq"
      end
    end
  end
end
end
