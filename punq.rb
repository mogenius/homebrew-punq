class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.6/punq-v1.5.6-darwin-arm64.tar.gz"
      sha256 "9dcfa9575b00c37af0ae363ad08c9cccfcc79ab7c944e308a8fd7e5e3599e4e5"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.6/punq-v1.5.6-darwin-amd64.tar.gz"
      sha256 "72ea58afb59626eaf460d3857d6ce47067296a55fb084e040684ad256ae59b18"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.6/punq-v1.5.6-linux-amd64.tar.gz"
        sha256 "e6c2ec0b0e1706b63418859b6a7195e58785dbf9a9665daf6a0cb4aa8697ef0e"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.6/punq-v1.5.6-linux-386.tar.gz"
        sha256 "3a15bcaff7d83fab15ba0622bc907b812097726ffbc2737217d9c264b8623d38"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.6/punq-v1.5.6-linux-arm64.tar.gz"
        sha256 "5226913c5594b6183ab52126a666702242e27dcef0e193e6a4b1fc2abdf4cbe8"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.5.6/punq-v1.5.6-linux-arm.tar.gz"
        sha256 "d43625e0501c72424df12becb61c7d2a2f7347dc0b0350082d8e767ff6518d5e"
      end
    end
  end
  
  version "1.5.6"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.5.6-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.5.6-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.5.6-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.5.6-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.5.6-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.5.6-linux-arm" => "punq"
      end
    end
  end
end
end
