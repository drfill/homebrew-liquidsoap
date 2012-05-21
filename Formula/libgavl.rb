require 'formula'

class Libgavl < Formula
  homepage 'http://gmerlin.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/gmerlin/gavl/1.2.0/gavl-1.2.0.tar.gz'
  md5 'f7dd25d3ef26a8d22f947e9383d251e7'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--without-doxygen"
    system "make install"
  end
end
