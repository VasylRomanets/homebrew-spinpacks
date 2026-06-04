class Spinpacks < Formula
  desc "Apply themed Claude Code spinner verb packs to your settings"
  homepage "https://github.com/VasylRomanets/spinpacks"
  url "https://github.com/VasylRomanets/spinpacks/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "a5a710732ed42f6515b663d3936f7ef17dc1c984a214dc0bce2ea222e5fc183e"
  license "MIT"

  def install
    bin.install "bin/spinpacks"
    prefix.install "packs"
    bash_completion.install "completions/spinpacks.bash"
    zsh_completion.install  "completions/_spinpacks"
    fish_completion.install "completions/spinpacks.fish"
  end

  def post_install
    ohai "Run `spinpacks apply the-office` to enable The Office spinner verbs"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/spinpacks version")
    assert_match "the-office", shell_output("#{bin}/spinpacks list")
  end
end
