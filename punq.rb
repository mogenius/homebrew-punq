class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.1/punq-v1.3.1-darwin-arm64.tar.gz"
      sha256 "65bc819317a805e0a6a50cbe97b41a215a2819638d6d530748835ef717583003"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.1/punq-v1.3.1-darwin-amd64.tar.gz"
      sha256 "fd91d889b2c148f2fe733e83a262e6ee86e11863f2fcd4555e47f2d7ba0bb03f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.1/punq-v1.3.1-linux-amd64.tar.gz"
        sha256 "cb74232c1e00826ec03f65b8ab1a2079e4f4ede3adbd3296d4290d92a15e45b9"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.1/punq-v1.3.1-linux-386.tar.gz"
        sha256 "df4f62d28633d181120db5119747274c7930c85c2132396c7d906c4d7ce5cba3"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.1/punq-v1.3.1-linux-arm64.tar.gz"
        sha256 "a2628da8cd4c8a8012f743308443f6f1337c55b19b9fee1165835330531f15d6"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.3.1/punq-v1.3.1-linux-arm.tar.gz"
        sha256 "48d296d248d5049cfa5a9528e1976a960ff26d9556f46fde1da471df1f96a6e4"
      end
    end
  end
  
  version "1.3.1"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.3.1-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.3.1-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.3.1-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.3.1-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.3.1-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.3.1-linux-arm" => "punq"
      end
    end
  end
end
end
