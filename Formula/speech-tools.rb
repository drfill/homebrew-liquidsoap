require 'formula'

class SpeechTools < Formula
  homepage 'http://festlang.berlios.de/docu/doku.php'
  url 'http://svn.berlios.de/svnroot/repos/festlang/trunk/speech_tools', :using => :svn
  version '2.0.95'

  keg_only ""

  def patches
    DATA
  end

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make", "-j1"
    system "make", "test"
    system "make", "install"
    system "make", "file-list"
    system "tar jcvf speech-tools.tar.bz2 `sed 's/^\\.\\///' <FileList` .time-stamp config/config lib/*.a"
    system "tar jxvf speech-tools.tar.bz2 -C #{prefix}"
  end
end

__END__
--- a/include/EST_math.h	2012-06-05 13:39:44.000000000 +0400
+++ b/include/EST_math.h	2012-06-05 13:40:26.000000000 +0400
@@ -100,10 +100,12 @@

 /* Apple OSX */
 #if defined(__APPLE__)
-#define isnanf(X) isnan((double)(X))
-/* on some previous versions of OSX we seemed to need the following */
-/* but not on 10.4 */
-/* #define isnan(X) __isnan(X) */
+#define isnanf(X) isnan(X)
+#if (__GNUC__ >= 4)
+#define isnan(X) __inline_isnan(X)
+#else
+#define isnan(X) __isnan(X)
+#endif
 #endif

 /* FreeBSD *and other 4.4 based systems require anything, isnanf is defined */
