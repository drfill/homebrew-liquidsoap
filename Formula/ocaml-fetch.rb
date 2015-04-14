require 'formula'

class OcamlFetch < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-fetch/0.1.0/ocaml-fetch-0.1.0.tar.gz'
  sha256 '4b5dcc5f58a276a8ab1d59ebe66e45c2b3c1791eb5a907502c65bf99bab09d4c'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'ocaml-ftp' => :optional

  def install
    ENV.j1
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    system "./configure", "--prefix=#{prefix}", "--without-smbclient"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install OCAMLFIND_LDCONF=ignore"
  end
end
