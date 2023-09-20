class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.37/punq-v1.2.37-darwin-arm64.tar.gz"
      sha256 "dde974fcee423f3017b80c6e507a1ec1389f084431b050f5b9a27ebe496216d0"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.37/punq-v1.2.37-darwin-amd64.tar.gz"
      sha256 "7bd9555e12a1060329b000f77edc7f4f92ea06e30041d6d8ef81732b389ff9d4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.37/punq-v1.2.37-linux-amd64.tar.gz"
        sha256 "4356a51b23b216fe9106dbf74a3bb935d2caa3b30193bf18b73eeb3970c9f3e0"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.37/punq-v1.2.37-linux-386.tar.gz"
        sha256 "1b7097211e803f5115ead524a30a340727f5c7eaa3290345c786bf3b17b9c4d5"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.37/punq-v1.2.37-linux-arm64.tar.gz"
        sha256 "43f66332e8aa5211904411313354123ef54ddf655ef282bd621ffd56916454c8"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.37/punq-v1.2.37-linux-arm.tar.gz"
        sha256 "651364c34f6a5025699cdd842708a739a2d86806a96c62a7f88e4d2eeba1384c"
      end
    end
  end
  
  version "1.2.37"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.37-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.37-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.37-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.37-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.37-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.37-linux-arm" => "punq"
      end
    end
  end
end
end
