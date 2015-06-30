require 'formula'

class OcamlCamomile < Formula
  url 'http://sourceforge.net/projects/camomile/files/camomile/0.8.3/camomile-0.8.3.tar.bz2'
  homepage 'http://camomile.sourceforge.net/'
  sha256 '94c8d65d417c90301f6b3b21e4b00e151c434a3e2d406c3d5b3363859034f27b'

  depends_on 'objective-caml' => :build
  depends_on 'camlp4' => :build
  depends_on 'ocaml-findlib' => :build

  def install
    ENV.j1
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    system './configure', "--prefix=#{prefix}"
    system 'make'
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install OCAMLFIND_LDCONF=ignore"
    Dir.glob("#{lib}/ocaml/site-lib/**/*stubs.so").each { |so| mkdir_p "#{lib}/ocaml/stublibs"; mv so, "#{lib}/ocaml/stublibs/" }
  end
end
