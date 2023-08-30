class Punq < Formula
  desc "View your kubernetes workloads relativly neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/vv1.1.28/punq-v1.1.28-darwin-arm64.tar.gz"
      sha256 "27e48cfef0b2b66280c6ed2875932450fbc00ec7a77ac01c9b62b11ea17a40c4"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/vv1.1.28/punq-v1.1.28-darwin-amd64.tar.gz"
      sha256 "ff5f9e2b87d161bcf2a5794d3387e52811b29d4cc91dd99cee72a38f909fa4d0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/vv1.1.28/punq-v1.1.28-linux-amd64.tar.gz"
        sha256 "03d9d387ddd8049db2b7964ed978899071e31eb5f27046bf0f8b37988d513f88"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/vv1.1.28/punq-v1.1.28-linux-386.tar.gz"
        sha256 "f4fbd101ca54c15b1d39becd375fa5c318f1e2b75f522aec733a8c9e39b5f4a1"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/vv1.1.28/punq-v1.1.28-linux-arm64.tar.gz"
        sha256 "9c67e55fdc2e66c1cb1da994d397ff7a1cae2de5161fb676ac51799c3464813b"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/vv1.1.28/punq-v1.1.28-linux-arm.tar.gz"
        sha256 "a3eed3c6f673f253483f23800561db868824f882b84f8dc833ff3a0025243a4e"
      end
    end
  end
  
  version "v1.1.28"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.1.28-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.1.28-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.1.28-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.1.28-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.1.28-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.1.28-linux-arm" => "punq"
      end
    end
  end
end
end
