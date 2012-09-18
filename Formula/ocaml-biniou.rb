require 'formula'

class OcamlBiniou < Formula
  homepage 'http://mjambon.com/'
  url 'http://mjambon.com/releases/biniou/biniou-1.0.5.tar.gz'
  md5 '04faafa8c3f1e3fe6e82d78330da46a0'

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
