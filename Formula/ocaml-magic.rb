require 'formula'

class OcamlMagic < Formula
  homepage 'http://sourceforge.net/projects/ocaml-magic/'
  url 'http://sourceforge.net/projects/ocaml-magic/files/ocaml-magic/0.7/ocaml-magic-0.7.3.tar.gz'
  md5 '5b8a4d149fe8ce095ab8115f2e49beba'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'libmagic' => :build

  def install
    ENV.j1
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    system './configure'
    system 'make'
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install OCAMLFIND_LDCONF=ignore"
    Dir.glob("#{lib}/ocaml/site-lib/**/*stubs.so").each { |so| mkdir_p "#{lib}/ocaml/stublibs"; mv so, "#{lib}/ocaml/stublibs/" }
  end
end
