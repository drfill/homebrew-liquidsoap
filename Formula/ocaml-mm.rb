require 'formula'

class OcamlMm < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-mm/0.2.0/ocaml-mm-0.2.0.tar.gz'
  md5 '319ce1604208c852835a20f8953cd676'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'ocaml-ogg' => :optional
  depends_on 'ocaml-theora' => :optional
  depends_on 'ocaml-ao' => :optional
  depends_on 'ocaml-mad' => :optional
#  depends_on 'ocaml-sdl' => :optional
#  depends_on 'ocaml-gstreamer' => :optional

  def install
    ENV.j1
    ENV.append "OCAMLPATH", "#{HOMEBREW_PREFIX}/lib/ocaml/site-lib"
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install OCAMLFIND_LDCONF=ignore"
    Dir.glob("#{lib}/ocaml/site-lib/**/*stubs.so").each { |so| mkdir_p "#{lib}/ocaml/stublibs"; mv so, "#{lib}/ocaml/stublibs/" }
  end
end
