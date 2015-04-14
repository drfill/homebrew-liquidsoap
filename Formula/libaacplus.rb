require 'formula'

class Libaacplus < Formula
  homepage 'http://tipok.org.ua/node/17'
  url 'http://217.20.164.161/~tipok/aacplus/libaacplus-2.0.2.tar.gz'
  sha256 'b2cd22239c92fc322e954f3e7d8c51d998fea13e96e6f385a90c66dbf38c21a2'

  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build

  def patches
      # configure.ac:8: error: 'AM_CONFIG_HEADER': this macro is obsolete. You should use the 'AC_CONFIG_HEADERS' macro instead.
      DATA
    end

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

__END__
--- a/configure.ac	2013-02-16 02:03:59.000000000 +0400
+++ b/configure.ac	2013-02-16 02:04:10.000000000 +0400
@@ -5,7 +5,7 @@
 #AM_INIT_AUTOMAKE([dist-bzip2])
 AM_INIT_AUTOMAKE
 
-AM_CONFIG_HEADER(config.h)
+AC_CONFIG_HEADERS(config.h)
 AC_CONFIG_MACRO_DIR([m4])
 # Checks for programs.
 AC_PROG_CC