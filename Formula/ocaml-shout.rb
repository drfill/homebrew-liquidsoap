# This Formula is no longer needed for liquidsoap and may be removed.

require 'formula'

class OcamlShout < Formula
  # Deprecated due to ocaml-cry
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-shout/0.2.7/ocaml-shout-0.2.7.tar.gz'
  sha256 '717fdcfed2833b27fe748e3fae5b932d61da855e98c3f66c00f3c62238be0fa3'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'libshout' => :build

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
