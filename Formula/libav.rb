require 'formula'

class Libav < Formula
  homepage 'http://libav.org/'
  head 'git://git.libav.org/libav.git', :using => :git
  devel do
    url 'http://libav.org/releases/libav-0.8.1.tar.gz'
    md5 'a5de4ed4b7a3510a7b03e532a43c0bad'
  end

  depends_on 'yasm' => :build

  def install
    # ENV.x11 # if your formula requires any X11 headers
    # ENV.j1  # if your formula's build system can't parallelize
    if ARGV.build_devel?
      system "./configure", "--disable-debug", "--prefix=#{prefix}"
      system "make install"
    end
  end

  def test
    system "false"
  end
end
