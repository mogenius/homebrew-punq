class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.39/punq-v1.2.39-darwin-arm64.tar.gz"
      sha256 "c70e3b663168136a71a7cefded3c44da16e5eef77cd4aa733885fc2e05709c4e"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.39/punq-v1.2.39-darwin-amd64.tar.gz"
      sha256 "43d09fdb066949f7a0e09456330d39c9befd973c17dc35f08a10645b4224a568"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.39/punq-v1.2.39-linux-amd64.tar.gz"
        sha256 "3b682cbccaef43b64c33959849a6e90fe4c44f43d226586680cfc4c18bd5c01c"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.39/punq-v1.2.39-linux-386.tar.gz"
        sha256 "c43434e369136f2350ecdec7d76ffebdcfbba085fd12777648e844e00880bebd"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.39/punq-v1.2.39-linux-arm64.tar.gz"
        sha256 "d96a3e195c9089b18fcc8170551149e0a9be4ba3a8b9660db3279f69ebb0fb92"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.39/punq-v1.2.39-linux-arm.tar.gz"
        sha256 "e16b715df0872e76cb0a79b16426106faa03ac4843f9699c595db298625eeaa2"
      end
    end
  end
  
  version "1.2.39"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.39-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.39-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.39-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.39-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.39-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.39-linux-arm" => "punq"
      end
    end
  end
end
end
