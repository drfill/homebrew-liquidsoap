require 'formula'

class OcamlNet < Formula
  homepage 'http://projects.camlcity.org/projects/ocamlnet.html'
  url 'http://download.camlcity.org/download/ocamlnet-3.5.1.tar.gz'
  md5 '9f4f474bfe88496220079e06791ff31c'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'ocaml-pcre' => :build
  depends_on 'ocaml-ssl' => :build
  depends_on 'ocaml-cryptokit' => :build

  def install
    ENV['OCAMLPATH'] = "#{HOMEBREW_PREFIX}/lib/ocaml/site-lib"
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    system "./configure", "-enable-pcre", "-enable-ssl", "-disable-zip", "-enable-crypto", "-bindir", "#{prefix}/bin", "-datadir", "#{lib}"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install OCAMLFIND_LDCONF=ignore"
    mkdir_p "#{lib}/ocaml/stublibs"
    system "mv #{lib}/ocaml/site-lib/*/*stubs.so #{lib}/ocaml/stublibs"
  end
end
