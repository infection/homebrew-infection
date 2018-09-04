class Infection < Formula
  desc "AST based PHP Mutation Testing Framework"
  homepage "https://infection.github.io"
  url "https://github.com/infection/infection/releases/download/0.10.3/infection.phar"
  version "0.10.3"
  sha256 "662a1ba3a59a8d1ee49e2da22cd003b9c00b4e93749a91785fe4e3f38d4f2ac3"

  depends_on "php71-xdebug" if Formula["php71"].linked_keg.exist?

  resource "pubkey" do
    url "https://github.com/infection/infection/releases/download/0.10.3/infection.phar.asc"
    sha256 "1f1235e72ec1bb73dcd79d1973005c25688aa5568c52b5d9d9acb1bc5c8e88d6"
  end

  def install
    bin.install "infection.phar" => "infection"
    resource("pubkey").stage { bin.install "infection.phar.asc" => "infection.asc" }
  end

  test do
    shell_output("#{bin}/infection --version").include?(version)
  end

end
