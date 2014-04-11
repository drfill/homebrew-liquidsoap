require 'formula'

class OcamlOgg < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-ogg/0.4.5/ocaml-ogg-0.4.5.tar.gz'
  sha1 '1bda2bd209454bdf6df5dfd9c231cff1a4f7d065'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'pkg-config' => :build
  depends_on 'libogg' => :build

  def install
    ENV.j1
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install OCAMLFIND_LDCONF=ignore"
    Dir.glob("#{lib}/ocaml/site-lib/**/*.h").each { |header| mkdir_p "#{include}"; mv header, "#{include}/" }
    Dir.glob("#{lib}/ocaml/site-lib/**/*stubs.so").each { |so| mkdir_p "#{lib}/ocaml/stublibs"; mv so, "#{lib}/ocaml/stublibs/" }
  end
end
