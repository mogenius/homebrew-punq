class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.32/punq-v1.1.32-darwin-arm64.tar.gz"
      sha256 "06fe1552b1fab0a60a5050fad6cb8cb7b2163ec13ebd618711580a34a1c7d259"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.32/punq-v1.1.32-darwin-amd64.tar.gz"
      sha256 "b3714be909a9115bc421d50d3fc42fdf06034b4e5a4c6d6c3f266b8b85a6a00c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.32/punq-v1.1.32-linux-amd64.tar.gz"
        sha256 "bb31782b61aea4f3fcfc7da036227bacfa447394a626397a18c1fa205b641cb7"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.32/punq-v1.1.32-linux-386.tar.gz"
        sha256 "11b67ffccd17f4e586658eef5e8a9d892d71c0b6108ff34d99f3a6847c6b4e1c"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.32/punq-v1.1.32-linux-arm64.tar.gz"
        sha256 "ed46f878d0959404b38670af5ff63317f9794f6cb8c60ac8340185ee20447186"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.32/punq-v1.1.32-linux-arm.tar.gz"
        sha256 "e5acca136a074bde851df98e584228883275519b0cd3f0718e509cca06168dfa"
      end
    end
  end
  
  version ""
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.1.32-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.1.32-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.1.32-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.1.32-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.1.32-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.1.32-linux-arm" => "punq"
      end
    end
  end
end
end
