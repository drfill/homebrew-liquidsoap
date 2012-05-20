require 'formula'

class Soundtouch < Formula
  url 'http://www.surina.net/soundtouch/soundtouch-1.6.0.tar.gz'
  homepage 'http://www.surina.net/soundtouch/'
  md5 'aa1c63d4d67b033f044a6a48d2be5bdd'

  depends_on 'autoconf' => :build

  def install
    # The build fails complaining about out of date libtools. Rerunning the autoconf from bootstrap prevents the error.
    system "sh", "bootstrap"

    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make install"
  end
end
