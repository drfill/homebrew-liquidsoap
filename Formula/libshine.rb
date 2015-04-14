require 'formula'

class Libshine < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/shine/shine-2.0.0.tar.gz'
  sha256 '80e6f518a66d9857b250759e3503dc6c596a993a979e27d25cb79f3c35e2ce97'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
