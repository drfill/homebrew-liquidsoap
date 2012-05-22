require 'formula'

class OcamlBiniou < Formula
  homepage 'http://mjambon.com/'
  url 'http://mjambon.com/biniou-1.0.0.tar.gz'
  md5 '0c80fec922ce698488d4f9e55ac26612'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'ocaml-easy-format' => :build

  def install
    ENV.j1
    ENV['OCAMLPATH'] = "#{HOMEBREW_PREFIX}/lib/ocaml/site-lib"
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install"
  end
end
