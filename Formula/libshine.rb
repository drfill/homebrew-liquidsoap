require 'formula'

class Libshine < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/shine/shine-2.0.0.tar.gz'
  sha1 'da9740eb2923d1aed8ec94d30dadfcd582e7c0a3'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
