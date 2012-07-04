require 'formula'

class Libdssi < Formula
  homepage 'http://dssi.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/dssi/dssi/1.1.1/dssi-1.1.1.tar.gz'
  md5 '619ab73c883b02dc37ddb37001591f8b'

  depends_on 'jack' => :build
  depends_on 'liblo' => :build
  depends_on 'ladspa_header' => :build
  depends_on 'libdssialsacompat' => :build

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
