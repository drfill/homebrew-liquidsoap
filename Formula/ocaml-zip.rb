require 'formula'

class OcamlZip < Formula
  homepage 'http://cristal.inria.fr/~xleroy/software.html#camlzip'
  url 'http://forge.ocamlcore.org/frs/download.php/328/camlzip-1.04.tar.gz'
  md5 'b3930f4f2e2563b9a5e1b17aa455e635'

  depends_on 'objective-caml' => :build

  def install
    inreplace "Makefile", "INSTALLDIR=`$(OCAMLC) -where`/zip", "INSTALLDIR=#{lib}/ocaml/site-lib/zip"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib/zip"
    mkdir_p "#{lib}/ocaml/stublibs"
    system "mv dllcamlzip.so #{lib}/ocaml/stublibs"
    system "make install"
  end
end
