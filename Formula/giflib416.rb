require 'formula'

class Giflib416 < Formula
  homepage 'http://giflib.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/giflib/giflib-4.x/giflib-4.1.6/giflib-4.1.6.tar.bz2'
  sha1 '22680f604ec92065f04caf00b1c180ba74fb8562'

  keg_only "Old version of GifLib. Homebrew does not supported it anymore." if Formula.factory('giflib').installed?

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
