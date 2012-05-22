require 'formula'

class OcamlCryptokit < Formula
  homepage 'http://gallium.inria.fr/~xleroy/software.html#cryptokit'
  url 'http://forge.ocamlcore.org/frs/download.php/639/cryptokit-1.5.tar.gz'
  md5 '4393bf2b20f8e18eb732c078d582d5ec'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build

  def install
    ENV['OCAMLPATH'] = "#{HOMEBREW_PREFIX}/lib/ocaml/site-lib"
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install"
  end
end
