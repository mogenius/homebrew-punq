class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.1/punq-v1.4.1-darwin-arm64.tar.gz"
      sha256 "0f81d422b0df707636ce29f3cb8146569226b5d366844ab83c67efb8f13e92ba"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.1/punq-v1.4.1-darwin-amd64.tar.gz"
      sha256 "3c22532f0f2401ba2a79cee6b2589f8bfa77734c1ad6a41d761e978b484e8cda"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.1/punq-v1.4.1-linux-amd64.tar.gz"
        sha256 "4eb2c9af5f63774eb1749fd3bd2706a216d86b9fffbe0a1f31b060a5956f6172"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.1/punq-v1.4.1-linux-386.tar.gz"
        sha256 "9a73578445aab889ca601773e73c1582466f7ecf593f2d7dce4c61b8deda12e3"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.1/punq-v1.4.1-linux-arm64.tar.gz"
        sha256 "7188d4e512a57ccd3ac992447c891bf93d03c5ab3990642b8c9644e0d7b56ce8"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.1/punq-v1.4.1-linux-arm.tar.gz"
        sha256 "1bb6b3f4924ecf5826ed273efd9b6aae6293e08dd3615b1b7db23e7658e15806"
      end
    end
  end
  
  version "1.4.1"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.4.1-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.4.1-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.4.1-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.4.1-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.4.1-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.4.1-linux-arm" => "punq"
      end
    end
  end
end
end
