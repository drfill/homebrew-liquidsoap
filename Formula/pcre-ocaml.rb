require 'formula'

class PcreOcaml < Formula
  url 'http://hg.ocaml.info/release/pcre-ocaml/archive/release-6.2.2.tar.bz2'
  homepage 'http://www.ocaml.info/home/ocaml_sources.html'
  md5 '9c89466d8bb801a6235598b04a98af26'
  devel do
    url 'http://hg.ocaml.info/release/pcre-ocaml/archive/release-6.2.5.tar.bz2'
    md5 '2c854b3cb456a7622668ef16789eff52'
  end

  depends_on 'objective-caml'
  depends_on 'ocaml-findlib'
  depends_on 'pcre'

  def install
    ENV.j1
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    system 'make'
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make", "install"
  end
end
