require 'formula'

class Soundtouch < Formula
  url 'http://www.surina.net/soundtouch/soundtouch-1.6.0.tar.gz'
  homepage 'http://www.surina.net/soundtouch/'
  sha256 '8776edaf7299ffe1e8c97285f020365a63c0e01aa4f6f7c5fd1d011c0ded278f'

  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build

  def install
    # The build fails complaining about out of date libtools. Rerunning the autoconf from bootstrap prevents the error.
    system "sh", "bootstrap"

    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking", "--enable-shared", "--disable-static"
    system "make install"
  end
end
