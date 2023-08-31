class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.37/punq-v1.1.37-darwin-arm64.tar.gz"
      sha256 "1d318cc4f7d8e70eefab218fb4f9891491bb40ad7ee09d1b23e10f88f99506b9"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.37/punq-v1.1.37-darwin-amd64.tar.gz"
      sha256 "624c36fcc3afe80c3f3671935f6001e064ec009926632cce18cec21cbac1c0bf"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.37/punq-v1.1.37-linux-amd64.tar.gz"
        sha256 "4ee77817c94ecb37c14caf0dc64c856d83d67b3962da4057831ab633eb98c3de"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.37/punq-v1.1.37-linux-386.tar.gz"
        sha256 "141112aeab37f437075b690dd7cbe9c6e3d607919992ca3f4d437b7a829c1d10"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.37/punq-v1.1.37-linux-arm64.tar.gz"
        sha256 "933dfa1bbfce0257773cca3e97b6674ac6605d37a37fc0b80ef561b008ab7099"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.37/punq-v1.1.37-linux-arm.tar.gz"
        sha256 "487807b7b5663fcef36a80eddcbc7bd9d61b7c248f2384aa50b4d76c1e412da0"
      end
    end
  end
  
  version ""
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.1.37-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.1.37-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.1.37-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.1.37-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.1.37-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.1.37-linux-arm" => "punq"
      end
    end
  end
end
end
