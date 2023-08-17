class Punq < Formula
  desc "View your kubernetes workloads relativly neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.0.9/punq-1.0.9-darwin-arm64.tar.gz"
      sha256 "c7e58249992014b779ea0b16575a15e3866873d42eeaa087e93099597056ee97"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.0.9/punq-1.0.9-darwin-amd64.tar.gz"
      sha256 "2f76536e7630b5377d5f81d57f6565058c520ce0eeb3258d3e46fed7d7b9f60c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.0.9/punq-1.0.9-linux-amd64.tar.gz"
        sha256 "5a3e8a5eac4d818a77d7d7c7551f7713d1fc0950d9740323b6434f841b2845df"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.0.9/punq-1.0.9-linux-386.tar.gz"
        sha256 "e04f409d2d2b5194f7350ae8a070916f82f72c59fd864f48e41080bf3eed3489"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.0.9/punq-1.0.9-linux-arm64.tar.gz"
        sha256 "b6a96a9db2a7d82db97983d1d65f075a47020c1b15dd760c4d1e486ba6af6b6e"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.0.9/punq-1.0.9-linux-arm.tar.gz"
        sha256 "28f2bb47ae87895ffa924ea57758c33b2d37b8f8f0704e8d58cbf0c90864309e"
      end
    end
  end
  
  version "1.0.9"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-1.0.9-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-1.0.9-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-1.0.9-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-1.0.9-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-1.0.9-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-1.0.9-linux-arm" => "punq"
      end
    end
  end
end
end
