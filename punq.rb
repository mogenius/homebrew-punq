class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.28/punq-v1.2.28-darwin-arm64.tar.gz"
      sha256 "46fa1f10deefb59b82dfa7a400859c9310d27cd4916181baedac4266f0de5832"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.28/punq-v1.2.28-darwin-amd64.tar.gz"
      sha256 "8402114a39d1e67d94e49aa0e1ad1c9b4e1c42104bd7ee6bb2f21fd19ba2473b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.28/punq-v1.2.28-linux-amd64.tar.gz"
        sha256 "d20ea9522de8bf9cf3625a989e80fbbac2167a7850899faa39c5912c3407e8cb"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.28/punq-v1.2.28-linux-386.tar.gz"
        sha256 "c9dcacf2ccf9872458211e94779dd98c85f779124b6f3c3ecb7855d24e7e7394"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.28/punq-v1.2.28-linux-arm64.tar.gz"
        sha256 "5af411aedf70fa42fc9b03a18e31d0753447f91c5fcd0ad66fb7852db815521d"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.28/punq-v1.2.28-linux-arm.tar.gz"
        sha256 "6b0181e288fc345cde14ff189c6e05eba63f794ac6d9ac77ce0740ef6d76a4fb"
      end
    end
  end
  
  version "1.2.28"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.28-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.28-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.28-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.28-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.28-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.28-linux-arm" => "punq"
      end
    end
  end
end
end
