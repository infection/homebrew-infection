class Infection < Formula
  desc "AST based PHP Mutation Testing Framework"
  homepage "https://infection.github.io"
  url "https://github.com/infection/infection/releases/download/0.9.0/infection.phar"
  sha256 "1ff4002f5f8300128975913babbe58c27978ce7e7572486e1d5270728eae8a3e"

  depends_on "php70-xdebug" if Formula["php70"].linked_keg.exist?
  depends_on "php71-xdebug" if Formula["php71"].linked_keg.exist?

  resource "pubkey" do
    url "https://github.com/infection/infection/releases/download/0.9.0/infection.phar.pubkey"
    sha256 "7a23dff08d1b34333d7eab3a643a56347800083592e55c7e0294bb32fbfc09c8"
  end

  def install
    bin.install "infection.phar" => "infection"
    resource("pubkey").stage { bin.install "infection.phar.pubkey" => "infection.pubkey" }
  end

  test do
    shell_output("#{bin}/infection --version").include?(version)
  end

end
