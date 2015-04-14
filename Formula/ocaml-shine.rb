require 'formula'

class OcamlShine < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-shine/0.1.1/ocaml-shine-0.1.1.tar.gz'
  sha256 'c8b18d6494cb6c7a06ac059955f49a406ec2b771923ccaa19cfeb02827a089cb'

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
