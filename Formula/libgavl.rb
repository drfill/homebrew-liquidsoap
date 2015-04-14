require 'formula'

class Libgavl < Formula
  homepage 'http://gmerlin.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/gmerlin/gavl/1.2.0/gavl-1.2.0.tar.gz'
  sha256 'f37d663d2c042f0903549f9df1ff2470cdb27d3370c767f560100d0d984c5c7b'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--without-doxygen"
    system "make install"
  end
end
