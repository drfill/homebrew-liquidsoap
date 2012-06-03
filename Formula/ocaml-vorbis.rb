require 'formula'

class OcamlVorbis < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://sourceforge.net/projects/savonet/files/ocaml-vorbis/0.6.1/ocaml-vorbis-0.6.1.tar.gz'
  md5 'f56c3566d1485e5b5cb9aa75acbd9d0c'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'ocaml-ogg' => :build
  depends_on 'libvorbis' => :build

  def install
    ENV['OCAMLPATH'] = "#{HOMEBREW_PREFIX}/lib/ocaml/site-lib"
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install OCAMLFIND_LDCONF=ignore"
    mkdir_p "#{lib}/ocaml/stublibs"
    system "mv #{lib}/ocaml/site-lib/*/*stubs.so #{lib}/ocaml/stublibs"
  end
end
