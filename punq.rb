class Punq < Formula
  desc "A slim open-source workload manager for Kubernetes with team collaboration, WebApp, and CLI."
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.3/punq-v1.4.3-darwin-arm64.tar.gz"
      sha256 "52b691e2d4ea45c400402364d5e6b0712e1a1597140c37285c198b39cf22d450"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.3/punq-v1.4.3-darwin-amd64.tar.gz"
      sha256 "848aef79663dbf092de3341439ab0e4a7f817562fe4edf8fe067d70204215efc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.3/punq-v1.4.3-linux-amd64.tar.gz"
        sha256 "3a0dcc2882015da499b40e93fb58cd7c17bf3728be54b2e47b5abcc7251de21c"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.3/punq-v1.4.3-linux-386.tar.gz"
        sha256 "56055d287e376169a0ee7a065bb1f1d11c3d5371a4942da1706651f021497d46"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.3/punq-v1.4.3-linux-arm64.tar.gz"
        sha256 "d3ab5148d0ee5614aa5cad9ee9e251c78626d85b46eb3bb4a72fadb85fa2f5a8"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.4.3/punq-v1.4.3-linux-arm.tar.gz"
        sha256 "d8340db02b5264546488599416ec8f78ed55f20bed142f39c0e559668fc9fa87"
      end
    end
  end
  
  version "1.4.3"
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.4.3-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.4.3-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.4.3-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.4.3-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.4.3-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.4.3-linux-arm" => "punq"
      end
    end
  end
end
end
