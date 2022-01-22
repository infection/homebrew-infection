class Infection < Formula
  desc "AST based PHP Mutation Testing Framework"
  homepage "https://infection.github.io"
  url "https://github.com/infection/infection/releases/download/0.26.2/infection.phar"
  version "0.26.2"
  sha256 "dc1063c29880b52978d87621c8e03b83d53ff57338807c335705152ac4ba464e"

  depends_on "php" => :test

  resource "pubkey" do
    url "https://github.com/infection/infection/releases/download/0.26.2/infection.phar.asc"
    sha256 "bacf2698ef48789fee23bd9570eb5466904bbd1e8cf43376e7f97c1f0a27f06d"
  end

  def install
    bin.install "infection.phar" => "infection"
    resource("pubkey").stage { bin.install "infection.phar.asc" => "infection.asc" }
  end

  test do
    shell_output("#{bin}/infection --version").include?(version)
  end

end
