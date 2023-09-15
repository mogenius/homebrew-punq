class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.14/punq-v1.2.14-darwin-arm64.tar.gz"
      sha256 "e77428e57f3b84b8ad5cba03316477a96ac2f4cc0998240f9d9e92f3b8e4169b"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.14/punq-v1.2.14-darwin-amd64.tar.gz"
      sha256 "6a61164f3976916a45dcf09e77086f7ba4b1c9bdb5a1ec6806286e9bb075245e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.14/punq-v1.2.14-linux-amd64.tar.gz"
        sha256 "c37d3997700ee6c9427fd267b7275f757f80f78be8d0c5a310c39709eeeceaf5"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.14/punq-v1.2.14-linux-386.tar.gz"
        sha256 "26a50f103e32ffb33a91c431d327705f461464544eb3fb2f925e8840fd2849a3"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.14/punq-v1.2.14-linux-arm64.tar.gz"
        sha256 "b0660e513c52bae270fd93fd7848c21044ee913aac74854a7f9a8af9c2db5f53"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.2.14/punq-v1.2.14-linux-arm.tar.gz"
        sha256 "bf86d9a97a3e1168d558da744553aeadd6aaed3eb17734aaf3b25ebb692456d0"
      end
    end
  end
  
  version "1.2.14"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.2.14-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.2.14-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.2.14-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.2.14-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.2.14-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.2.14-linux-arm" => "punq"
      end
    end
  end
end
end
