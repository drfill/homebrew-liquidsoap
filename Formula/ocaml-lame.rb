require 'formula'

class OcamlLame < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://sourceforge.net/projects/savonet/files/ocaml-lame/0.3.1/ocaml-lame-0.3.1.tar.gz'
  md5 '070d913c6e565b568da1bc491f232a8a'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'lame' => :build

  def install
    ENV.llvm if MacOS.xcode_version >= "4.2"
    ENV.gcc if MacOS.xcode_version < "4.2"
    ENV.j1
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install OCAMLFIND_LDCONF=ignore"
    Dir.glob("#{lib}/ocaml/site-lib/**/*stubs.so").each { |so| mkdir_p "#{lib}/ocaml/stublibs"; mv so, "#{lib}/ocaml/stublibs/" }
  end
end
