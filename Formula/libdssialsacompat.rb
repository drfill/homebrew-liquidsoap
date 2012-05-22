require 'formula'

class Libdssialsacompat < Formula
  homepage 'http://smbolton.com/linux.html'
  url 'http://smbolton.com/linux/libdssialsacompat-1.0.8a.tar.gz'
  md5 'ef1e9ca4e91a4e0bc0fcb9a12e978c23'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
