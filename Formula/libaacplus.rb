require 'formula'

class Libaacplus < Formula
  homepage 'http://tipok.org.ua/node/17'
  url 'http://217.20.164.161/~tipok/aacplus/libaacplus-2.0.2.tar.gz'
  md5 '3fc15d5aa91d0e8b8f94acb6555103da'

  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build

  def install
    ENV.llvm if MacOS.xcode_version >= "4.2" # This fields contains dirty hack
    ENV.gcc if MacOS.xcode_version < "4.2"   # to provide ability install aacplus library
    ENV.deparallelize
    inreplace 'autogen.sh', 'libtool', 'glibtool'
    system "./autogen.sh", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--disable-libtool-lock"
    inreplace "Makefile", "distdir = $(PACKAGE)-$(VERSION)", "distdir = #{pwd}"
    system "make"
    system "make install"
  end
end
