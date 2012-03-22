require 'formula'

class VoAacenc < Formula
  homepage 'http://sourceforge.net/projects/opencore-amr/'
  url 'http://downloads.sourceforge.net/project/opencore-amr/vo-aacenc/vo-aacenc-0.1.2.tar.gz'
  md5 'cc862dce14ea5d688506904160c65a02'

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
