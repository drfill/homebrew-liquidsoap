require 'formula'

class Libdssialsacompat < Formula
  homepage 'http://smbolton.com/linux.html'
  url 'http://smbolton.com/linux/libdssialsacompat-1.0.8a.tar.gz'
  sha256 '420f2be813577e4b20444f1af359a8a4efb6859543b0692b893770e337f23a29'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
