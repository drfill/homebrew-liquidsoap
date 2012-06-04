require 'formula'

class OcamlCamomile < Formula
  url 'http://prdownloads.sourceforge.net/camomile/camomile-0.8.3.tar.bz2'
  homepage 'http://camomile.sourceforge.net/'
  md5 'c6476bdb4138d222bc14396a82205034'

  depends_on 'objective-caml' => :build
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
