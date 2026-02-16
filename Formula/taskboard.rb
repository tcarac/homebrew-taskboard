class Taskboard < Formula
  desc 'Local project management with Kanban UI and MCP server for AI assistants'
  homepage 'https://github.com/tcarac/taskboard'
  version '0.6.0'
  license 'MIT'

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tcarac/taskboard/releases/download/v#{version}/taskboard-darwin-arm64.tar.gz"
      sha256 'c868a9366483b9e09624d355acee6fbad76e19eaef43a22099dfa5c0754f513b'
    elsif Hardware::CPU.intel?
      url "https://github.com/tcarac/taskboard/releases/download/v#{version}/taskboard-darwin-amd64.tar.gz"
      sha256 '9a74d1a9dea02e66dfe124107f2675a4c86b33ffdc06276d7e81c96acdf60d03'
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tcarac/taskboard/releases/download/v#{version}/taskboard-linux-arm64.tar.gz"
      sha256 '3749fb985f544fdb6788ba1dff69761e599ff82b3fe86d39ca54307c0f523e9d'
    elsif Hardware::CPU.intel?
      url "https://github.com/tcarac/taskboard/releases/download/v#{version}/taskboard-linux-amd64.tar.gz"
      sha256 'ea5d28c266d4cc7caf4aa86f5efd575871d6255ff2e41d61a84201f5d68647e9'
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
