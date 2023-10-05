class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.4/punq-v1.3.4-darwin-arm64.tar.gz"
      sha256 "2a0f0f394d559c21f3a474871f613bb025ba195c1aab2a49bac21710d43313eb"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.4/punq-v1.3.4-darwin-amd64.tar.gz"
      sha256 "df8bb0db14c9e163e4701ebfd75e96497a9cd5cb6f08e9d72e22f2aa547f5dfa"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.4/punq-v1.3.4-linux-amd64.tar.gz"
        sha256 "90e48f4fde31b9a2990a4477001cb208e3090bd6a3e273587f7ee01ac04073b9"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.4/punq-v1.3.4-linux-386.tar.gz"
        sha256 "e1645e3e9670bf5e80579796f9c21b6f502f863735b6b7850060cb3149dfd855"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.4/punq-v1.3.4-linux-arm64.tar.gz"
        sha256 "27c93d60dcda9b2099e1f0f358087b3058500e4232a50359e2b570036de41224"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.4/punq-v1.3.4-linux-arm.tar.gz"
        sha256 "23fa1151d4018bbadb1dad713657b4fe6b8c236067ab1a356f3214c8b75177c1"
      end
    end
  end
  
  version "1.3.4"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.3.4-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.3.4-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.3.4-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.3.4-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.3.4-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.3.4-linux-arm" => "punq"
      end
    end
  end
end
end
