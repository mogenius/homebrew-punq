class Punq < Formula
  desc "View your kubernetes workloads relativly neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.4/punq-1.1.4-darwin-arm64.tar.gz"
      sha256 "aeda8350255a6df811f239e47cfb40e40bb487a10940f793c1a5e83f002d16db"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.4/punq-1.1.4-darwin-amd64.tar.gz"
      sha256 "9d8702c91abe265e6367f3bb6979bed916068468c0327197acedeb8aa7a221e2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.4/punq-1.1.4-linux-amd64.tar.gz"
        sha256 "d2cbb93829361860f4b35d31e358fb84753fff5ba6234b6f5f125cf191267fa1"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.4/punq-1.1.4-linux-386.tar.gz"
        sha256 "a3a04409cbdd310def064a3cec5c27c47fb26a960aa06ff37bac8c9b453b03b4"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.4/punq-1.1.4-linux-arm64.tar.gz"
        sha256 "b5972903cef19bd8ce724be5fe2349e11289caa85200ff72a0429cab4cdb0654"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.4/punq-1.1.4-linux-arm.tar.gz"
        sha256 "c0cf4e4fce07bf63f9783b24d56c4823d66c20ffb11b14455d5a7e71ac7c8585"
      end
    end
  end
  
  version "1.1.4"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-1.1.4-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-1.1.4-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-1.1.4-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-1.1.4-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-1.1.4-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-1.1.4-linux-arm" => "punq"
      end
    end
  end
end
end
