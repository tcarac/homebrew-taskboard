class Taskboard < Formula
  desc 'Local project management with Kanban UI and MCP server for AI assistants'
  homepage 'https://github.com/tcarac/taskboard'
  version '0.6.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tcarac/taskboard/releases/download/v#{version}/taskboard-darwin-arm64.tar.gz"
      sha256 '928cd453ad7151fe04dd7959dada839c9a78335f8ec375f6f9f7e2e550669b66'
    elsif Hardware::CPU.intel?
      url "https://github.com/tcarac/taskboard/releases/download/v#{version}/taskboard-darwin-amd64.tar.gz"
      sha256 '3884b973924c3334a667642ab5512d8fd0b38491f139ad3ca74f018b43b93e3e'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tcarac/taskboard/releases/download/v#{version}/taskboard-linux-arm64.tar.gz"
      sha256 '6bb831b102327413abeacd800347d4749cbe0d6c6d6cc1f4f73306573fa348b9'
    elsif Hardware::CPU.intel?
      url "https://github.com/tcarac/taskboard/releases/download/v#{version}/taskboard-linux-amd64.tar.gz"
      sha256 '03541483f3ba41a20df4da94b3cfc6b8ed41af5a9c9d93f810ae1a6b117325e2'
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install 'taskboard-darwin-arm64' => 'taskboard'
      else
        bin.install 'taskboard-darwin-amd64' => 'taskboard'
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install 'taskboard-linux-arm64' => 'taskboard'
      else
        bin.install 'taskboard-linux-amd64' => 'taskboard'
      end
    end
  end

  test do
    assert_match 'taskboard', shell_output("#{bin}/taskboard --help")
  end
end
