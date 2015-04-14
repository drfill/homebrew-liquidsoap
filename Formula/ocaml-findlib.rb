require 'formula'

class OcamlFindlib < Formula
  homepage 'http://projects.camlcity.org/projects/findlib.html'
  url 'http://download.camlcity.org/download/findlib-1.3.3.tar.gz'
  sha256 '981f5c67118a2be015efa79f3af3cb0063376b93123b5d695e7cb5c586b1d45c'

  depends_on 'objective-caml' => :build
  depends_on 'camlp4' => :build

  def install
    system "./configure -config #{etc}/findlib.conf -sitelib #{HOMEBREW_PREFIX}/lib/ocaml/site-lib -system osx -bindir #{bin} -mandir #{man} -with-toolbox"
    system 'make'
    system 'make opt'
    system "make install"
  end
end
