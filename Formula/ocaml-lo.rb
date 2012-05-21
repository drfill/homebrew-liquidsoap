require 'formula'

class OcamlLo < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-lo/0.1.0/ocaml-lo-0.1.0.tar.gz'
  md5 '40a4538062f7985a988b63482968015d'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'liblo' => :build

  def install
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install"
  end
end
