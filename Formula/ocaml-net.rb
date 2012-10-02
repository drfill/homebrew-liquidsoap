require 'formula'

class OcamlNet < Formula
  homepage 'http://projects.camlcity.org/projects/ocamlnet.html'
  url 'http://download.camlcity.org/download/ocamlnet-3.6.tar.gz'
  md5 'c6a42744c456b3b336c7613f5481650a'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'ocaml-pcre' => :build
  depends_on 'ocaml-ssl' => :build
  depends_on 'ocaml-cryptokit' => :build

  def install
    ENV.j1
    ENV.append "OCAMLPATH", "#{HOMEBREW_PREFIX}/lib/ocaml/site-lib"
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    system "./configure -enable-pcre -enable-ssl -disable-zip -enable-crypto -bindir #{bin} -datadir #{lib}"
    system "make"
    system "make opt"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install OCAMLFIND_LDCONF=ignore"
    Dir.glob("#{lib}/ocaml/site-lib/**/*.so").each { |so| mkdir_p "#{lib}/ocaml/stublibs"; mv so, "#{lib}/ocaml/stublibs/" }
  end
end
