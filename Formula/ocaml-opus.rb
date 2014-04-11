require 'formula'

class OcamlOpus < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-opus/0.1.0/ocaml-opus-0.1.0.tar.gz'
  sha1 '0ca59df824c10437693b6badae2f5de61571bb5f'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'pkg-config' => :build
  depends_on 'opus' => :build

  def install
    ENV.j1
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install OCAMLFIND_LDCONF=ignore"
    Dir.glob("#{lib}/ocaml/site-lib/**/*stubs.so").each { |so| mkdir_p "#{lib}/ocaml/stublibs"; mv so, "#{lib}/ocaml/stublibs/" }
  end
end
