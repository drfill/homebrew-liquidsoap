require 'formula'

class OcamlCryptokit < Formula
  homepage 'http://gallium.inria.fr/~xleroy/software.html#cryptokit'
  url 'http://forge.ocamlcore.org/frs/download.php/891/cryptokit-1.6.tar.gz'
  sha256 'c58cb6ee1efa996bb227d64b378e80824637f875e914ad38833d610b7f992422'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build

  def install
    ENV.j1
    ENV.append "OCAMLPATH", "#{HOMEBREW_PREFIX}/lib/ocaml/site-lib"
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install OCAMLFIND_LDCONF=ignore"
    Dir.glob("#{lib}/ocaml/site-lib/**/*.so").each { |so| mkdir_p "#{lib}/ocaml/stublibs"; mv so, "#{lib}/ocaml/stublibs/" }
  end
end
