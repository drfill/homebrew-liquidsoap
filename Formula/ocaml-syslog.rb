require 'formula'

class OcamlSyslog < Formula
  homepage 'http://homepage.mac.com/letaris/'
  url 'http://ftp.de.debian.org/debian/pool/main/s/syslog-ocaml/syslog-ocaml_1.4.orig.tar.gz'
  sha256 '2d885a36e2acd32085fffe5396840b0f78704ebc4fdecd1efc6ed86e6809eda8'
  version '1.4'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build

  def install
    ENV.j1
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    system "make"
    system "make opt"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install OCAMLFIND_LDCONF=ignore"
    Dir.glob("#{lib}/ocaml/site-lib/**/*stubs.so").each { |so| mkdir_p "#{lib}/ocaml/stublibs"; mv so, "#{lib}/ocaml/stublibs/" }
  end
end
