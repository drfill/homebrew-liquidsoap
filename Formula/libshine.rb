require 'formula'

class Libshine < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/shine/shine-2.0.0.tar.gz'
  sha256 '54dc2219582e476ff854519fa1d7f9560323132f24b0ffb77dcf0da812edd5db'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
