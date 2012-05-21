require 'formula'

class PcreOcaml < Formula
  homepage 'http://www.ocaml.info/home/ocaml_sources.html'
  url 'https://bitbucket.org/mmottl/pcre-ocaml/downloads/pcre-ocaml-6.2.5.tar.gz'
  md5 'a6f8873bbf5d2d0897654cc35fa59a42'

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
