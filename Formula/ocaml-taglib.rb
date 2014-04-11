require 'formula'

class OcamlTaglib < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-taglib/0.3.1/ocaml-taglib-0.3.1.tar.gz'
  sha1 'c7cee257532e2467092007b10e1a406e3c8a9d96'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'pkg-config' => :build
  depends_on 'taglib' => :build

  def install
    ENV.j1
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install OCAMLFIND_LDCONF=ignore"
    Dir.glob("#{lib}/ocaml/site-lib/**/*stubs.so").each { |so| mkdir_p "#{lib}/ocaml/stublibs"; mv so, "#{lib}/ocaml/stublibs/" }
  end
end
