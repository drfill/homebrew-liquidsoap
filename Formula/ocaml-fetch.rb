require 'formula'

class OcamlFetch < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-fetch/0.1.0/ocaml-fetch-0.1.0.tar.gz'
  sha256 'a13f4f1c7892db6dd8a4d4e52d00924097e934283794e154c1c07762f18265b9'

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
