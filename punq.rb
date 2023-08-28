class Punq < Formula
  desc "View your kubernetes workloads relativly neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.24/punq-1.1.24-darwin-arm64.tar.gz"
      sha256 "d44de14852fecc2dc690c4d9b8d731119fdd3591ab9619e6fb08e7b6b815e720"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.24/punq-1.1.24-darwin-amd64.tar.gz"
      sha256 "af3621033dcca26a34e57d40b00a884d96806bc757b8b34b8d93d2ef84c4a200"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.24/punq-1.1.24-linux-amd64.tar.gz"
        sha256 "b214fd8ef56e3c6460f6ac90b341fd6a374b149fee4d52824206fa96408bfc0a"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.24/punq-1.1.24-linux-386.tar.gz"
        sha256 "8e323cb66851c9821c90d5ebfbe3f553f98f52f3713370ecf0935f1fc1b9289a"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.24/punq-1.1.24-linux-arm64.tar.gz"
        sha256 "20367e6d3b8fcd82e167eadee1ac4aa32d8b31de56db6e9cb1f4df32a7e66d7d"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.24/punq-1.1.24-linux-arm.tar.gz"
        sha256 "85a57fe2861b46343652c4fb7e013fb3d864ad76be9ad20ef2b36abb94e9779e"
      end
    end
  end
  
  version "1.1.24"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-1.1.24-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-1.1.24-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-1.1.24-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-1.1.24-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-1.1.24-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-1.1.24-linux-arm" => "punq"
      end
    end
  end
end
end
