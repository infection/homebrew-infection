class Infection < Formula
  desc "AST based PHP Mutation Testing Framework"
  homepage "https://infection.github.io"
  url "https://github.com/infection/infection/releases/download/0.10.0/infection.phar"
  sha256 "d08bead8819d3554f7bb1b76453a9977aa7907de5c0b02473b841a81dd6b8884"

  depends_on "php71-xdebug" if Formula["php71"].linked_keg.exist?

  resource "pubkey" do
    url "https://github.com/infection/infection/releases/download/0.10.0/infection.phar.asc"
    sha256 "e3390fb76023c3e475de0d646a5170231931cc92ccc62bf5f2d1c956a650a76c"
  end

  def install
    bin.install "infection.phar" => "infection"
    resource("pubkey").stage { bin.install "infection.phar.asc" => "infection.asc" }
  end

  test do
    shell_output("#{bin}/infection --version").include?(version)
  end

end
