require 'formula'

class OcamlFtp < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-ftp/0.1.0/ocaml-ftp-0.1.0.tar.gz'
  sha256 '21554003c160cc76bd2ab43d546ba56103ebd62a2aeead50cdffe7e40ee91cc7'

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
