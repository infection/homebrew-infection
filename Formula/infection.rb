class Infection < Formula
  desc "AST based PHP Mutation Testing Framework"
  homepage "https://infection.github.io"
  url "https://github.com/infection/infection/releases/download/0.29.9/infection.phar"
  version "0.29.9"
  sha256 "e636f48733e05b8ef8354970ff7077c28b1f3a895bed4cb34f9be8b0c1aa16d5"

  depends_on "php" => :test

  resource "pubkey" do
    url "https://github.com/infection/infection/releases/download/0.29.9/infection.phar.asc"
    sha256 "9d374c84f5a9006c0297530e39ff51bab989613c9434e2f1f6f4fecf58a6f6d1"
  end

  def install
    bin.install "infection.phar" => "infection"
    resource("pubkey").stage { bin.install "infection.phar.asc" => "infection.asc" }
  end

  test do
    shell_output("#{bin}/infection --version").include?(version)
  end

end
