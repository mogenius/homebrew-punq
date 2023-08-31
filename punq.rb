class Punq < Formula
  desc "View your kubernetes workloads relatively neat!"
  homepage "https://punq.dev"
  
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.38/punq-v1.1.38-darwin-arm64.tar.gz"
      sha256 "536c2a56fb1835d44ac1c72d40324f9d2cc870046c92acc736f007fe090b81b2"
    elsif Hardware::CPU.intel?
      url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.38/punq-v1.1.38-darwin-amd64.tar.gz"
      sha256 "afb59ad6c8206fd48b063aa6aca84636e63aa8cb1f809ab431e561bad8faab14"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.38/punq-v1.1.38-linux-amd64.tar.gz"
        sha256 "5bdc337461eff2be5dd571b9f43702b7fed12189eca6cc2e85232e55dae2a67d"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.38/punq-v1.1.38-linux-386.tar.gz"
        sha256 "52ffed2992761b47ab04ab6ca2abc636cb6a5515ad140b4efc6e150691faeba6"
      end
    elif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.38/punq-v1.1.38-linux-arm64.tar.gz"
        sha256 "61544b64335f6cc55c5f519b693dd03c702e0f5ba97f34ab2d1db85b8245b8ff"
      else
        url "https://github.com/mogenius/homebrew-punq/releases/download/v1.1.38/punq-v1.1.38-linux-arm.tar.gz"
        sha256 "a545e8e5c5ffbe94938c55ffd2007167f464b5ef1b4c3a0015b835620c48df9e"
      end
    end
  end
  
  version ""
  license "MIT"

  def install
  if OS.mac?
    if Hardware::CPU.arm?
      # Installation steps for macOS ARM64
      bin.install "punq-v1.1.38-darwin-arm64" => "punq"
    elsif Hardware::CPU.intel?
      # Installation steps for macOS AMD64
      bin.install "punq-v1.1.38-darwin-amd64" => "punq"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux AMD64
        bin.install "punq-v1.1.38-linux-amd64" => "punq"
      else
        # Installation steps for Linux 386
        bin.install "punq-v1.1.38-linux-386" => "punq"
      end
    elsif Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        # Installation steps for Linux ARM64
        bin.install "punq-v1.1.38-linux-arm64" => "punq"
      else
        # Installation steps for Linux ARM
        bin.install "punq-v1.1.38-linux-arm" => "punq"
      end
    end
  end
end
end
