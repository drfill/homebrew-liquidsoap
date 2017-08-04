require 'formula'

class Libshine < Formula
  homepage 'http://liquidsoap.fm/'
  url 'https://github.com/toots/shine/releases/download/3.1.1/shine-3.1.1.tar.gz'
  sha256 '58e61e70128cf73f88635db495bfc17f0dde3ce9c9ac070d505a0cd75b93d384'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
