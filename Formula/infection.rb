class Infection < Formula
  desc "AST based PHP Mutation Testing Framework"
  homepage "https://infection.github.io"
  url "https://github.com/infection/infection/releases/download/0.14.1/infection.phar"
  version "0.14.1"
  sha256 "0c7f9325d7f6406de2a1fb36c6c7ceba2aa5ffbd74d1f390eb2290f28a857f29"

  depends_on "php72-xdebug" if Formula["php72"].linked_keg.exist?

  resource "pubkey" do
    url "https://github.com/infection/infection/releases/download/0.14.1/infection.phar.asc"
    sha256 "32a3bb69b5df83f3b9668125cf10b901df766018b1ef2b91826c835fa1bf414c"
  end

  def install
    bin.install "infection.phar" => "infection"
    resource("pubkey").stage { bin.install "infection.phar.asc" => "infection.asc" }
  end

  test do
    shell_output("#{bin}/infection --version").include?(version)
  end

end
