class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.19/punq-v1.2.19-darwin-arm64.tar.gz"
      sha256 "0a2fcf2c0866da49eaecd18db3dc8a9b7f893892b90034fe136b09be30623eac"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.19/punq-v1.2.19-darwin-amd64.tar.gz"
      sha256 "b09e753f4c40e22df60eb52c5b0e1eea17e94df5c66ae5d36959548a65c6dd33"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.19/punq-v1.2.19-linux-amd64.tar.gz"
        sha256 "13c747ae60393966ac17b0a6b8563995b55e995c96b910211e1298e2026db64e"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.19/punq-v1.2.19-linux-386.tar.gz"
        sha256 "dd53eaac705df8566b8be1231ec5d04438ab8e299a072c25acfbe9c3af720e04"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.19/punq-v1.2.19-linux-arm64.tar.gz"
        sha256 "cb83096b92d575980064439e6772428d53ec25265d2e97b766a2c219472d8c67"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.19/punq-v1.2.19-linux-arm.tar.gz"
        sha256 "ef43f7bb1da2a3b407a9490ddcc80601adcb9c16d7b0e26810e08e0653ef41f6"
      end
    end
  end
  
  version "1.2.19"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.19-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.19-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.19-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.19-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.19-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.19-linux-arm" => "punq"
      end
    end
  end
end
end
