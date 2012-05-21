require 'formula'

class OcamlFaad < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-faad/0.3.0/ocaml-faad-0.3.0.tar.gz'
  md5 '81571625e9c3a86044bb3ad82c71c82e'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'faad2' => :build

  def install
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install"
  end
end
