class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.8/punq-v1.5.8-darwin-arm64.tar.gz"
      sha256 "b3fcf3ffd2bbb4e8670a03f9e77c0e9d1b0df9640f6632d86ab4381fc8f045b8"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.8/punq-v1.5.8-darwin-amd64.tar.gz"
      sha256 "4d530934b4572f33588125d1edae2f6ff96c3f89ae0ccd0e88f7b1e26f671ffc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.8/punq-v1.5.8-linux-amd64.tar.gz"
        sha256 "295c80a668a579fbcdcc93413f884e52d1404be3dcebe6693ca4f81f4e3b16e7"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.8/punq-v1.5.8-linux-386.tar.gz"
        sha256 "6a5f9aae2afe35e1e586afd057bed08c1ba529d628a39ff6e4a4c065782c9f37"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.8/punq-v1.5.8-linux-arm64.tar.gz"
        sha256 "73de2d54392c77050d971932489b2ad829dcbfc143598c4acf2325d116225398"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.8/punq-v1.5.8-linux-arm.tar.gz"
        sha256 "809f935c71fefd7b65d22ac32298e28381de15adcbaeaabb39c332c4604bb1a1"
      end
    end
  end
  
  version "1.5.8"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.5.8-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.5.8-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.5.8-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.5.8-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.5.8-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.5.8-linux-arm" => "punq"
      end
    end
  end
end
end
