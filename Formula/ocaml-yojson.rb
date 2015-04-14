require 'formula'

class OcamlYojson < Formula
  homepage 'http://mjambon.com/'
  url 'http://mjambon.com/yojson-1.0.3.tar.gz'
  sha256 'a8d36202ea2749b26c0e9d93ed1d9e74bd8aff94b32173ca0a99e896d957591b'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'ocaml-easy-format' => :build
  depends_on 'ocaml-biniou' => :build
  depends_on 'ocaml-cppo' => :build

  def install
    ENV.j1
    ENV.append "OCAMLPATH", "#{HOMEBREW_PREFIX}/lib/ocaml/site-lib"
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    system 'make'
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make", "install"
  end
end
