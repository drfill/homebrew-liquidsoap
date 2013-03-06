require 'formula'

class Libshine < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/shine/shine-1.0.0.tar.gz'
  sha1 '98b8e47034df75c7da19c4ec8344391a837cc5fe'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
