require 'formula'

class OcamlFindlib < Formula
  homepage 'http://projects.camlcity.org/projects/findlib.html'
  url 'http://download.camlcity.org/download/findlib-1.3.1.tar.gz'
  md5 'e632bad87f1c7be9414a6b754232ba01'

  depends_on 'objective-caml' => :build

  def install
    system './configure', '-config',  "#{prefix}/etc", "-sitelib", "#{lib}/ocaml/site-lib", "-system", "osx", "-bindir", "#{bin}", "-mandir", "#{man}"
    system 'make'
    system 'make opt'
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install"
  end
end
