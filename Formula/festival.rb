require 'formula'

class Festival < Formula
  homepage 'http://festlang.berlios.de/docu/doku.php'
  url 'http://svn.berlios.de/svnroot/repos/festlang/trunk/festival', :using => :svn
  version '2.0.95'

  keg_only ""

  depends_on 'speech-tools' => :build
  
  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    inreplace "config/config", "EST=$(TOP)/../speech_tools", "EST=#{Formula.factory("speech-tools").prefix}"
    system "make", "-j1"
    system "make", "install"
    system "make", "file-list"
    system "tar jcvf speech-tools.tar.bz2 `sed 's/^\\.\\///' <FileList` config/config"
    system "tar jxvf speech-tools.tar.bz2 -C #{prefix}"
    bin.install Dir['examples/*\.sh']
  end
end
