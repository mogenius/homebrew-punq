class Punq < Formula
  desc "View your kubernetes workloads relativly neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.5/punq-1.1.5-darwin-arm64.tar.gz"
      sha256 "3d780585c6061aba9d8b10147bf877de5974c4f37313b030173f52042cc4a699"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.5/punq-1.1.5-darwin-amd64.tar.gz"
      sha256 "869b45fb7a28febd9e008a001229c2aad3ac2f144434d2dfd12a21489f9bd640"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.5/punq-1.1.5-linux-amd64.tar.gz"
        sha256 "4c794b8449e37c12ff939c3dfef097e7fb1d68643aed86c581e063f48a7dd6da"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.5/punq-1.1.5-linux-386.tar.gz"
        sha256 "817dccdcd11e16ab1e14fef9b3091386f41b4b7d173c468e084511366c63d504"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.5/punq-1.1.5-linux-arm64.tar.gz"
        sha256 "a0cc951e90581e8a77ef4b03381763ac2806a90f09338456fd14ccc28575e11c"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.5/punq-1.1.5-linux-arm.tar.gz"
        sha256 "ea12dc4066c08da39f330b262f891e150b8d58991034dd0a0eefb0558796e228"
      end
    end
  end
  
  version "1.1.5"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-1.1.5-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-1.1.5-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-1.1.5-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-1.1.5-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-1.1.5-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-1.1.5-linux-arm" => "punq"
      end
    end
  end
end
end
