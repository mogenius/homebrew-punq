class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.39/punq-v1.1.39-darwin-arm64.tar.gz"
      sha256 "20c08eb56098b1d3f3e6590d8fd1b86aaaabbf6cf07ffbacd985ddee6d849cb9"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.39/punq-v1.1.39-darwin-amd64.tar.gz"
      sha256 "d95ac53a970cd5971676b3da092aa2d8f6293b4964bd4cc61e6ae5898c2a9729"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.39/punq-v1.1.39-linux-amd64.tar.gz"
        sha256 "887e44b1b9cafbdb4f753ba30cc00cb776d66a3bf6d50df2c35335f09600c412"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.39/punq-v1.1.39-linux-386.tar.gz"
        sha256 "480c8f02007cb11365f546b9e7f93fca82d006bbfeaa47429278f294d31d2a27"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.39/punq-v1.1.39-linux-arm64.tar.gz"
        sha256 "57c58360135ad4f4c1ee477f20bfcb93d2c5136ef1a5b84d59b3a0b20340df89"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.39/punq-v1.1.39-linux-arm.tar.gz"
        sha256 "07ce17f6315798af67aef45bee168c1419f3b3fee218ada9b241c3d13358726c"
      end
    end
  end
  
  version ""
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.1.39-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.1.39-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.1.39-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.1.39-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.1.39-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.1.39-linux-arm" => "punq"
      end
    end
  end
end
end
