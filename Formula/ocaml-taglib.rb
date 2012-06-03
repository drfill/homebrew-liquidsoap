require 'formula'

class OcamlTaglib < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-taglib/0.2.0/ocaml-taglib-0.2.0.tar.gz'
  md5 '3e15260d935ce1791edc39b512391b24'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'taglib' => :build

  def install
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install OCAMLFIND_LDCONF=ignore"
    mkdir_p "#{lib}/ocaml/stublibs"
    system "mv #{lib}/ocaml/site-lib/*/*stubs.so #{lib}/ocaml/stublibs"
  end
end
