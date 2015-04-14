require 'formula'

class OcamlZip < Formula
  homepage 'http://cristal.inria.fr/~xleroy/software.html#camlzip'
  url 'http://forge.ocamlcore.org/frs/download.php/328/camlzip-1.04.tar.gz'
  sha256 '76f5f88a468722e851b3a959ef93e7c61dffb877fbaafa2b71a7a7146e85ecfe'

  depends_on 'objective-caml' => :build

  def install
    ENV.j1
    inreplace "Makefile", "INSTALLDIR=`$(OCAMLC) -where`/zip", "INSTALLDIR=#{lib}/ocaml/site-lib/zip"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib/zip"
    system "make install OCAMLFIND_LDCONF=ignore"
    Dir.glob("#{lib}/ocaml/site-lib/**/*.so").each { |so| mkdir_p "#{lib}/ocaml/stublibs"; mv so, "#{lib}/ocaml/stublibs/" }
  end
end
