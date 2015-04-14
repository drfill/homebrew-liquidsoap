require 'formula'

class Libdssi < Formula
  homepage 'http://dssi.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/dssi/dssi/1.1.1/dssi-1.1.1.tar.gz'
  sha256 'f2c82b073a947c8255284249097667f9b14e660bf86186f3fcd3b3b3e087814e'

  depends_on 'jack' => :build
  depends_on 'liblo' => :build
  depends_on 'ladspa_header' => :build
  depends_on 'libdssialsacompat' => :build

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
