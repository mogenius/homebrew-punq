class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.21/punq-v1.2.21-darwin-arm64.tar.gz"
      sha256 "e58b79da006a083880a0fe0da3617e19f78f572dfb6aa0edd3f9d1c00c0ee361"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.21/punq-v1.2.21-darwin-amd64.tar.gz"
      sha256 "a377dc4ce5181f8e10a0fb361f498146dc40385b5f6fcdab198a142c42ee0af3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.21/punq-v1.2.21-linux-amd64.tar.gz"
        sha256 "103752e07c4e8d76d63cf32d554203a0a4c2575e0ccc7962faa657ecebd9a864"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.21/punq-v1.2.21-linux-386.tar.gz"
        sha256 "f4ab99eb5e815922954ea5b7700a0b39f4b8dd14d893b68b4cb543c8ad68a1eb"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.21/punq-v1.2.21-linux-arm64.tar.gz"
        sha256 "57ea56d73d2a67625ff715be4e2ded48262fdf501b9a3273398867166c493e61"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.21/punq-v1.2.21-linux-arm.tar.gz"
        sha256 "f327731cc09dad529565cb5396cbd53f79fab9ee09ad13e8d2a4353b77d72fbb"
      end
    end
  end
  
  version "1.2.21"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.21-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.21-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.21-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.21-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.21-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.21-linux-arm" => "punq"
      end
    end
  end
end
end
