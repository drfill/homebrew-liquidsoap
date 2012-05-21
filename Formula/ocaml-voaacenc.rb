require 'formula'

class OcamlVoaacenc < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-voaacenc/0.1.0/ocaml-voaacenc-0.1.0.tar.gz'
  md5 'b2cd855f586d4550758c3c6d4f28006d'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'libvo-aacenc' => :build

  def install
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install"
  end
end
