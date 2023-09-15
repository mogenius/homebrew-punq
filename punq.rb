class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.16/punq-v1.2.16-darwin-arm64.tar.gz"
      sha256 "7eafb4164716c453e3aff9e519e88f2de2b6b1f1b20425f04380a8435672baf7"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.16/punq-v1.2.16-darwin-amd64.tar.gz"
      sha256 "e305d9d471a074f53015ebd8926f043415d4b412fd26cc096ce75f7dbe70e491"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.16/punq-v1.2.16-linux-amd64.tar.gz"
        sha256 "cc6c4a200e1bcd96295eff62e895531d1ff7fa495aa011563507054f0891a4eb"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.16/punq-v1.2.16-linux-386.tar.gz"
        sha256 "4845035629b28cb0527c4b5402eb1e2ca7fff5d10d6827fe3dc2b76109b94b53"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.16/punq-v1.2.16-linux-arm64.tar.gz"
        sha256 "08326d3ef59bdc7e98ac7645c018401bab07f517bf6550355f972e229dbfe6e2"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.16/punq-v1.2.16-linux-arm.tar.gz"
        sha256 "794b5cc5d1bf2c9efa12a5e17e147d4e4d618f5d2f6a922eb074e2e9fe867e8e"
      end
    end
  end
  
  version "1.2.16"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.16-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.16-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.16-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.16-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.16-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.16-linux-arm" => "punq"
      end
    end
  end
end
end
