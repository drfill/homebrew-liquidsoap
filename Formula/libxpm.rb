require 'formula'

class Libxpm < Formula
  homepage 'http://xorg.freedesktop.org/'
  url 'http://xorg.freedesktop.org/releases/individual/lib/libXpm-3.5.7.tar.bz2'
  md5 'cd15ee542d9f515538b4462a6f79d977'

  def install
    ENV.x11
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
