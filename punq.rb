class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.2/punq-v1.3.2-darwin-arm64.tar.gz"
      sha256 "72c3f9e308f5a522c5d63bd510b0e70bb49c5066e56c7a5551b99cb005963911"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.2/punq-v1.3.2-darwin-amd64.tar.gz"
      sha256 "49e2edd9d41be5952c0f0aa654b899944f90ba02e763dfb71a6f5137582efee7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.2/punq-v1.3.2-linux-amd64.tar.gz"
        sha256 "7ef89f373b571035f0be07f2a954068aedd97baac6ecd8ee9098e7c23a645cf6"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.2/punq-v1.3.2-linux-386.tar.gz"
        sha256 "254d7602fb160ae3b8cdf47c4d2c1e147bacc3a5c6d54e28fe28449bccc06b4f"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.2/punq-v1.3.2-linux-arm64.tar.gz"
        sha256 "058924f6e2e5ee9688b600998b33ab9ad31be561f3d2f5b5f3d915240ab324eb"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.2/punq-v1.3.2-linux-arm.tar.gz"
        sha256 "9f38a5254478a5d5546da7efc4af6a4480652c28577e771d70c383f7e453e2af"
      end
    end
  end
  
  version "1.3.2"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.3.2-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.3.2-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.3.2-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.3.2-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.3.2-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.3.2-linux-arm" => "punq"
      end
    end
  end
end
end
