class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.17/punq-v1.2.17-darwin-arm64.tar.gz"
      sha256 "d2eec9fe70c22ab49b64c0dada7318847fa2aa47692fc7210e45b4bfcec342a2"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.17/punq-v1.2.17-darwin-amd64.tar.gz"
      sha256 "dde0ce16bed534e7d9d71e70e3777299908991034546c1a5186da15052b8fc27"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.17/punq-v1.2.17-linux-amd64.tar.gz"
        sha256 "0c635969c1b241f2dd8b98851f3bae4811c733f858d2ac667816bf3f4f9f53bc"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.17/punq-v1.2.17-linux-386.tar.gz"
        sha256 "1043e4d313b5cfe294752758eda389919d6bcb91e717e1300d463c4cda2309ec"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.17/punq-v1.2.17-linux-arm64.tar.gz"
        sha256 "c3d816f9079ee267cb30c7700db454cb40552caacd9747c4602f3797155a9f5d"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.17/punq-v1.2.17-linux-arm.tar.gz"
        sha256 "37f2b7b688a7ce440be5419e79e2dec6ee5f34a603c1b8e03992fa324ae07801"
      end
    end
  end
  
  version "1.2.17"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.17-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.17-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.17-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.17-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.17-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.17-linux-arm" => "punq"
      end
    end
  end
end
end
