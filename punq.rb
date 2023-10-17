class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.7/punq-v1.4.7-darwin-arm64.tar.gz"
      sha256 "f3f9dfba1e7a0254b166ebb7056e7962bd526e121254ea28b1fece9ae70d662b"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.7/punq-v1.4.7-darwin-amd64.tar.gz"
      sha256 "56fd378378216b6d337e5439968e662a9f3b14bdc48de42311f6a157466e0b2a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.7/punq-v1.4.7-linux-amd64.tar.gz"
        sha256 "ebad788ae690bb7ffc14729207dac989ffc6ff68b613a0aadcb16415a870b3e4"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.7/punq-v1.4.7-linux-386.tar.gz"
        sha256 "0ce02cc2a41b4d8a5786b765e5ae157b1b5e5ffb13e9db7f4aebf0f739ebdee0"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.7/punq-v1.4.7-linux-arm64.tar.gz"
        sha256 "7171ea0516dc9ad8448414f10e5eb6fb9fb1c79044fce6764d33c18780fa523a"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.7/punq-v1.4.7-linux-arm.tar.gz"
        sha256 "ca02097a57952f7b9a9fb29e1074d817361f9b4a47a7e97b121be3a753e641e2"
      end
    end
  end
  
  version "1.4.7"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.4.7-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.4.7-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.4.7-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.4.7-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.4.7-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.4.7-linux-arm" => "punq"
      end
    end
  end
end
end
