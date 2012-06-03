require 'formula'

class OcamlSyslog < Formula
  homepage 'http://homepage.mac.com/letaris/'
  url 'http://homepage.mac.com/letaris/syslog-1.4.tar.gz'
  md5 '3042185e6f511aea9956cd8f172b1a84'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build

  def install
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    system "make"
    system "make opt"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install OCAMLFIND_LDCONF=ignore"
    mkdir_p "#{lib}/ocaml/stublibs"
    system "mv #{lib}/ocaml/site-lib/*/*stubs.so #{lib}/ocaml/stublibs"
  end
end
