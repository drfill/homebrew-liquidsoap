require 'formula'

class Camomile < Formula
  url 'http://prdownloads.sourceforge.net/camomile/camomile-0.8.3.tar.bz2'
  homepage 'http://camomile.sourceforge.net/'
  md5 'c6476bdb4138d222bc14396a82205034'

  depends_on 'objective-caml'
  depends_on 'ocaml-findlib'

  def install
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    ENV.j1
    system './configure', "--prefix=#{prefix}"
    system 'make'
    mkdir_p "#{prefix}/lib/ocaml/site-lib"
    system "make install"
  end
end
