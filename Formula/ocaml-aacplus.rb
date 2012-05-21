require 'formula'

class OcamlAacplus < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-aacplus/0.2.0/ocaml-aacplus-0.2.0.tar.gz'
  md5 '0fdcd34079c59c9e69ba6d79aa5d4c15'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'libaacplus' => :build

  def install
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install"
  end
end
