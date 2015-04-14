require 'formula'

class OcamlShine < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-shine/0.1.1/ocaml-shine-0.1.1.tar.gz'
  sha256 'c7b47be0dd7f83c976cd23805dd27ddcf9e69983ba16b72f9ba369ca300eac48'

  depends_on 'objective-caml' => :build
  depends_on 'pkg-config' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'libshine' => :build

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
