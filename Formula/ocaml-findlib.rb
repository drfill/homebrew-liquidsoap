require 'formula'

class OcamlFindlib < Formula
  homepage 'http://projects.camlcity.org/projects/findlib.html'
  url 'http://download.camlcity.org/download/findlib-1.3.3.tar.gz'
  md5 'a4c22ad5e0d38367a73cf58a25fcbebd'

  depends_on 'objective-caml' => :build
  depends_on 'camlp4' => :build

  def install
    system "./configure -config #{etc}/findlib.conf -sitelib #{HOMEBREW_PREFIX}/lib/ocaml/site-lib -system osx -bindir #{bin} -mandir #{man} -with-toolbox"
    system 'make'
    system 'make opt'
    system "make install"
  end
end
