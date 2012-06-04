require 'formula'

class OcamlCry < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://sourceforge.net/projects/savonet/files/ocaml-cry/0.2.2/ocaml-cry-0.2.2.tar.gz'
  md5 '1de9dda722710f939b08ab68fb77a4bc'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build

  def install
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install OCAMLFIND_LDCONF=ignore"
    Dir.glob("#{lib}/ocaml/site-lib/**/*stubs.so").each { |so| mkdir_p "#{lib}/ocaml/stublibs"; mv so, "#{lib}/ocaml/stublibs/" }
  end
end
