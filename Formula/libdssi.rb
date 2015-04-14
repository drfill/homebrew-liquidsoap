require 'formula'

class Libdssi < Formula
  homepage 'http://dssi.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/dssi/dssi/1.1.1/dssi-1.1.1.tar.gz'
  sha256 'f03d9e53c913990a83f21973ce873c770bd703fa87f0db327dc572be2ccd66bc'

  depends_on 'jack' => :build
  depends_on 'liblo' => :build
  depends_on 'ladspa_header' => :build
  depends_on 'libdssialsacompat' => :build

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
