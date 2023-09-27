class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.38/punq-v1.2.38-darwin-arm64.tar.gz"
      sha256 "9045768337823a209c39f9865f9215862d887453eaa757cc5fb43d3113be5934"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.38/punq-v1.2.38-darwin-amd64.tar.gz"
      sha256 "72e68e3343163ff039ca001c7ce9850ca7b444d35ad357c8682e9536ae60451c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.38/punq-v1.2.38-linux-amd64.tar.gz"
        sha256 "616837f5f748125ec4c50d467708dd86fba31cb06b59fe8a070734496c46f544"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.38/punq-v1.2.38-linux-386.tar.gz"
        sha256 "62b4d059c8a085f387d35b1d1c25a5feed21ae2a1855da602f984ef012859b24"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.38/punq-v1.2.38-linux-arm64.tar.gz"
        sha256 "b3ca292312fdc48ec48aa03717ba6670c54837fafcdc294348d448e47ff6df4d"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.38/punq-v1.2.38-linux-arm.tar.gz"
        sha256 "ad5ef4e17d1a7cd685ddfc0a9f2ad464ad531132a7338d61c9dd0be9c153a312"
      end
    end
  end
  
  version "1.2.38"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.38-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.38-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.38-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.38-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.38-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.38-linux-arm" => "punq"
      end
    end
  end
end
end
