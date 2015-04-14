require 'formula'

class OcamlFtp < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-ftp/0.1.0/ocaml-ftp-0.1.0.tar.gz'
  sha256 '5c1c6dc777202d84a5d82f73754c5afe10ab77b7202c6a09191a1a4a82d3f37b'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build

  def install
    ENV.j1
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install OCAMLFIND_LDCONF=ignore"
  end
end
