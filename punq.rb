class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.43/punq-v1.1.43-darwin-arm64.tar.gz"
      sha256 "7cc916f7dd1ec2a86b550409512420c4548be311404edb1c3dfc80e55939968a"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.43/punq-v1.1.43-darwin-amd64.tar.gz"
      sha256 "84861eeb486541f7229afed070421de6683b410202b7b8e54cef35dbc08c0b74"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.43/punq-v1.1.43-linux-amd64.tar.gz"
        sha256 "60ad0b090c4bc5e05a4076c6f1bcf0c21f3a25c4bbb84d43a7f5fd74b68263c1"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.43/punq-v1.1.43-linux-386.tar.gz"
        sha256 "3a2ddb1687a086cc7eb1fb04c72440424ecae38bbf53a5b765a6b04f143b3187"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.43/punq-v1.1.43-linux-arm64.tar.gz"
        sha256 "bac46f91794e41b25a0d761f42d550809e94e666ffa6f231e82918bf4b2e30c6"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.43/punq-v1.1.43-linux-arm.tar.gz"
        sha256 "f52cd894dcae66cd39077b7c73ef65f50ca33984b41f7069eb85586279bfcb25"
      end
    end
  end
  
  version "1.1.43"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.1.43-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.1.43-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.1.43-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.1.43-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.1.43-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.1.43-linux-arm" => "punq"
      end
    end
  end
end
end
