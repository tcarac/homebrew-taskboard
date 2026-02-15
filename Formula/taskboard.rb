class Taskboard < Formula
  desc 'Local project management with Kanban UI and MCP server for AI assistants'
  homepage 'https://github.com/tcarac/taskboard'
  version '0.4.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tcarac/taskboard/releases/download/v#{version}/taskboard-darwin-arm64.tar.gz"
      sha256 '468b24c86ebd85a258a2b47309865018a13446d83b7fdefb518a67806ac3f5fb'
    elsif Hardware::CPU.intel?
      url "https://github.com/tcarac/taskboard/releases/download/v#{version}/taskboard-darwin-amd64.tar.gz"
      sha256 '7621c0a2cd6652bc04d8df7f83822b79bfc35ec098fa334181f7a8ca948a1e79'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tcarac/taskboard/releases/download/v#{version}/taskboard-linux-arm64.tar.gz"
      sha256 '1d76abdb4c10b3b791265e8895f473b90bb213ce3d69bcc3cca0ad50c7a380c1'
    elsif Hardware::CPU.intel?
      url "https://github.com/tcarac/taskboard/releases/download/v#{version}/taskboard-linux-amd64.tar.gz"
      sha256 'b9e626690dad49860a63bc06ab6e337dac62b8010746ab7b5896e0201ae934c1'
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
