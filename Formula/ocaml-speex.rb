require 'formula'

class OcamlSpeex < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-speex/0.2.0/ocaml-speex-0.2.0.tar.gz'
  md5 'acfa92885fa94e46b888bdbc8fbc417a'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'speex' => :build
  depends_on 'ocaml-ogg' => :build

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
