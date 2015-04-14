require 'formula'

class OcamlEasyFormat < Formula
  homepage 'http://mjambon.com/'
  url 'http://mjambon.com/releases/easy-format/easy-format-1.0.1.tar.gz'
  sha256 '4b1c030de944158d9e62ce30f59ae2c007ea87b492e92463d8aced22a858f403'

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
