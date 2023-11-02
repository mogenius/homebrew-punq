class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.2/punq-v1.5.2-darwin-arm64.tar.gz"
      sha256 "de4e45a9e69ea370e14ffe0ac14308123e36d484e54a47848339a95d9876da02"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.2/punq-v1.5.2-darwin-amd64.tar.gz"
      sha256 "e381ef738f8d9567dd2ceba64338ec14fde97a5128dd73274940b73694827167"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.2/punq-v1.5.2-linux-amd64.tar.gz"
        sha256 "29b5bd1ebfeaf66991e3e4af5577f32e17b7611ebc638d2a4615b26b8ebaaddc"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.2/punq-v1.5.2-linux-386.tar.gz"
        sha256 "68bbf12fc08b2943b5c044ecf0a85f712380dd10e6cec694952aefb0a4b42349"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.2/punq-v1.5.2-linux-arm64.tar.gz"
        sha256 "b42edfaf0b311fc73abc2265af1f15651f6ab22b81aa6d2700093ba2355f3c22"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.2/punq-v1.5.2-linux-arm.tar.gz"
        sha256 "7f987a9f17b863d74c9cdcbd66258eb1911be27878e81ba5a641ee10705cd347"
      end
    end
  end
  
  version "1.5.2"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.5.2-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.5.2-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.5.2-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.5.2-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.5.2-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.5.2-linux-arm" => "punq"
      end
    end
  end
end
end
