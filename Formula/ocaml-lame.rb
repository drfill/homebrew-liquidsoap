require 'formula'

class OcamlLame < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://sourceforge.net/projects/savonet/files/ocaml-lame/0.3.2/ocaml-lame-0.3.2.tar.gz'
  sha1 'a4dd496a58e3bd0bae47f8c6f82ebe8809a4afb5'

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
