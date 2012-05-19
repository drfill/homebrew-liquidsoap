require 'formula'

class Biniou < Formula
  homepage 'http://mjambon.com/'
  url 'http://mjambon.com/biniou-1.0.0.tar.gz'
  md5 '0c80fec922ce698488d4f9e55ac26612'

  depends_on 'objective-caml'
  depends_on 'easy-format'
  depends_on 'ocaml-findlib'

  def install
    ENV.j1
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    system 'make'
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make", "install"
  end
end
