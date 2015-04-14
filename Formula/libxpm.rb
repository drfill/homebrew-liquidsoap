require 'formula'

class Libxpm < Formula
  homepage 'http://xorg.freedesktop.org/'
  url 'http://xorg.freedesktop.org/releases/individual/lib/libXpm-3.5.7.tar.bz2'
  sha256 '64701ae67ce5b0797307b75d8255bec3a0d371d0c50715ea618f5a68bcc92baa'

  def install
    ENV.x11
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
