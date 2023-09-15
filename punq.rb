class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.15/punq-v1.2.15-darwin-arm64.tar.gz"
      sha256 "e02751a0fa9edc9fbc3221aa5d60f2bc2aeab4c786428350433699605598cbf3"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.15/punq-v1.2.15-darwin-amd64.tar.gz"
      sha256 "82429c2b7551a978ff0046f22f833a2e7572b1e057e2cfd965b435056e39821e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.15/punq-v1.2.15-linux-amd64.tar.gz"
        sha256 "24ca185d57e52763368e1ae1c1d5077d98570d57ff7d10a821e1f5a0b5414e52"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.15/punq-v1.2.15-linux-386.tar.gz"
        sha256 "3138f98b3da4a934568a34f59e432a126e6737bfc10c5581b07eb8a7a6499b2d"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.15/punq-v1.2.15-linux-arm64.tar.gz"
        sha256 "e13ef6d964bdfb96a03819ea7122e66c2dcb7bda9641b4fdbd21c8345f24bde0"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.15/punq-v1.2.15-linux-arm.tar.gz"
        sha256 "0023efe349df98fd1c6043a0c740aedb17e3b705e3c7e2db9cb212abd0be7ddc"
      end
    end
  end
  
  version "1.2.15"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.15-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.15-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.15-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.15-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.15-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.15-linux-arm" => "punq"
      end
    end
  end
end
end
