require 'formula'

class OcamlEasyFormat < Formula
  homepage 'http://mjambon.com/'
  url 'http://mjambon.com/easy-format-1.0.0.tar.gz'
  md5 'bbb01bbf67cf3f578a84381c9b1f79d9'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build

  def install
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install"
  end
end
