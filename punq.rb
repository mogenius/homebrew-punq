class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.8/punq-v1.2.8-darwin-arm64.tar.gz"
      sha256 "41636c1f43695ba7e63b267ab175784917bbf39f17631b332501dd7354014974"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.8/punq-v1.2.8-darwin-amd64.tar.gz"
      sha256 "d5e83007f565d10af3f52015bb84c731868c17a067d920be306fde3ed7b5fa15"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.8/punq-v1.2.8-linux-amd64.tar.gz"
        sha256 "416b559dbd92f177963e42329059058b7d77562b386035cc4878427550e21056"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.8/punq-v1.2.8-linux-386.tar.gz"
        sha256 "ee43eb99dfbbb934280aca705ab0136859433586f848965e6ec29a6aae9ea003"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.8/punq-v1.2.8-linux-arm64.tar.gz"
        sha256 "98c011d765790488c90c9e729f37d83fea95d4351148351d7f2d6aa00ff0e581"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.8/punq-v1.2.8-linux-arm.tar.gz"
        sha256 "7b0666822f898ddff95914060373d80659d44d3483abd25a84d5ebc6216afc54"
      end
    end
  end
  
  version "1.2.8"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.8-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.8-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.8-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.8-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.8-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.8-linux-arm" => "punq"
      end
    end
  end
end
end
