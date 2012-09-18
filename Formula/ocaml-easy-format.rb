require 'formula'

class OcamlEasyFormat < Formula
  homepage 'http://mjambon.com/'
  url 'http://mjambon.com/releases/easy-format/easy-format-1.0.1.tar.gz'
  md5 'ecaf5d060f7cf8961631ab319e40677c'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build

  def install
    ENV.j1
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install"
  end
end
