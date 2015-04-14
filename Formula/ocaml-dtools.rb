require 'formula'

class OcamlDtools < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-dtools/0.3.1/ocaml-dtools-0.3.1.tar.gz'
  sha256 '2c399001dc999be25998943c4fefa1dd4f6887f1ffe0b6ef4f1f1c8288b7ae2b'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'ocaml-syslog' => :build

  def install
    ENV.j1
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install"
  end
end
