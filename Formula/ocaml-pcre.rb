require 'formula'

class OcamlPcre < Formula
  homepage 'http://mmottl.github.io/pcre-ocaml/'
  url 'https://github.com/mmottl/pcre-ocaml/archive/v7.1.1.tar.gz'
  sha256 '81e10db7154dfd848c5ee733bf1ba7a8d4477ca62acad263ff2d48827c51f2b3'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'pcre' => :build

  def install
    ENV.j1
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    system 'make'
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install OCAMLFIND_LDCONF=ignore"
    Dir.glob("#{lib}/ocaml/site-lib/**/*stubs.so").each { |so| mkdir_p "#{lib}/ocaml/stublibs"; mv so, "#{lib}/ocaml/stublibs/" }
  end
end
