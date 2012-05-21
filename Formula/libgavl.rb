require 'formula'

class Libgavl < Formula
  homepage 'http://gmerlin.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/gmerlin/gavl/1.2.0/gavl-1.2.0.tar.gz'
  md5 'f7dd25d3ef26a8d22f947e9383d251e7'

  # depends_on 'nasm' => :build if Hardware.is_32_bit?
  # depends_on 'yasm' => :build if Hardware.is_64_bit?

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--without-doxygen"
    system "make install" # if this fails, try separate make/make install steps
  end
end
