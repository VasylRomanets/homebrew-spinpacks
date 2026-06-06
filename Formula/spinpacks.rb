class Spinpacks < Formula
  desc "Apply themed Claude Code spinner verb packs to your settings"
  homepage "https://github.com/VasylRomanets/spinpacks"
  url "https://github.com/VasylRomanets/spinpacks/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "30a06d1fb2b457c9ac652839579d32b3a3b12cabd3ec80c36503b7aa1b67747b"
  license "MIT"

  def install
    bin.install "bin/spinpacks"
    prefix.install "packs"
    bash_completion.install "completions/spinpacks.bash"
    zsh_completion.install  "completions/_spinpacks"
    fish_completion.install "completions/spinpacks.fish"
  end

  def post_install
    ohai "Run `spinpacks install the-office` to enable The Office spinner verbs"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/spinpacks version")
    assert_match "the-office", shell_output("#{bin}/spinpacks list")
  end
end
