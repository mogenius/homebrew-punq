class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.33/punq-v1.1.33-darwin-arm64.tar.gz"
      sha256 "3a9c0bf7beec2ecdc00db54223379115201ada0fdddfc29565cdb7967647302e"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.33/punq-v1.1.33-darwin-amd64.tar.gz"
      sha256 "a151ce44a6ea4ffe5554c618d68bd985e51b76903b2bce2033a6f686a407d01b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.33/punq-v1.1.33-linux-amd64.tar.gz"
        sha256 "930cb8b1468597fb0cdf9d387d542ceb1da445f702137f18200945b64cbc10a2"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.33/punq-v1.1.33-linux-386.tar.gz"
        sha256 "406fd67b2a993f725357a4fefafa845a333fc66b293cdff3921c200826ffca6b"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.33/punq-v1.1.33-linux-arm64.tar.gz"
        sha256 "0963b1282e599291cb06569202a76e638eadd11e07ef203c1b9868b44d611d51"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.33/punq-v1.1.33-linux-arm.tar.gz"
        sha256 "0db6e9aec70219d4303f14d3fef5b2d7aa0e85afae12ecd1ac7a574e77e2797b"
      end
    end
  end
  
  version ""
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.1.33-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.1.33-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.1.33-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.1.33-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.1.33-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.1.33-linux-arm" => "punq"
      end
    end
  end
end
end
