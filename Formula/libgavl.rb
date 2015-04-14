require 'formula'

class Libgavl < Formula
  homepage 'http://gmerlin.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/gmerlin/gavl/1.2.0/gavl-1.2.0.tar.gz'
  sha256 '814120339f7a99d35c36e0eb61ba6cf60bd939ee4a47d73a17f3ba1438c5f88e'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--without-doxygen"
    system "make install"
  end
end
