class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.40/punq-v1.2.40-darwin-arm64.tar.gz"
      sha256 "644e003b7097aac89cc5b3e04cd5eedb6a5fe6494e301f6fe58e17b41a001773"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.40/punq-v1.2.40-darwin-amd64.tar.gz"
      sha256 "72db42456d1dd74e925a1278f99bd7968cbe1ecbe8e37edb1ca0c8a06e29f451"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.40/punq-v1.2.40-linux-amd64.tar.gz"
        sha256 "bbfa0ef0ee99005ce17b8a68fccfe10013a2211a32ae7a4eda354fc1e46b0941"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.40/punq-v1.2.40-linux-386.tar.gz"
        sha256 "0b43f1e2d29cd7e17d1228ec831fa17acc3bc48738d45e6e7e77abd4844eec93"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.40/punq-v1.2.40-linux-arm64.tar.gz"
        sha256 "bb4ab31715dd213ca2d9c6a74ed018c87259c14f7effec2774d32c2f45e239b5"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.40/punq-v1.2.40-linux-arm.tar.gz"
        sha256 "35fd5b84f87968eb97a10228f4364cdcd3402cdbbc760dbf686bb8af7837aa3b"
      end
    end
  end
  
  version "1.2.40"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.40-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.40-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.40-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.40-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.40-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.40-linux-arm" => "punq"
      end
    end
  end
end
end
