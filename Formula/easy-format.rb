require 'formula'

class EasyFormat < Formula
  homepage 'http://mjambon.com/'
  url 'http://mjambon.com/easy-format-1.0.0.tar.gz'
  md5 'bbb01bbf67cf3f578a84381c9b1f79d9'

  depends_on 'objective-caml'
  depends_on 'ocaml-findlib'

  def install
    ENV.j1
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    system 'make'
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make", "install"
  end
end
