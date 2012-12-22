require 'formula'

class OcamlBiniou < Formula
  homepage 'https://github.com/mjambon/biniou/tree/v1.0.5/'
  url 'https://github.com/mjambon/biniou/archive/v1.0.5.zip'
  md5 'e2701f981d71acb6ab3deed7e77a031d'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'ocaml-easy-format' => :build

  def install
    ENV.j1
    ENV.append "OCAMLPATH", "#{HOMEBREW_PREFIX}/lib/ocaml/site-lib"
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    system "make clean"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install"
  end
end
