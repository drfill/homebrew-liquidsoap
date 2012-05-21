require 'formula'

class OcamlCamomile < Formula
  url 'http://prdownloads.sourceforge.net/camomile/camomile-0.8.3.tar.bz2'
  homepage 'http://camomile.sourceforge.net/'
  md5 'c6476bdb4138d222bc14396a82205034'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build

  def install
    ENV.j1
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    system './configure', "--prefix=#{prefix}"
    system 'make'
    mkdir_p "#{prefix}/lib/ocaml/site-lib"
    system "make install"
  end
end
