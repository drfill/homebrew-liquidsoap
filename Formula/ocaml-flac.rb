require 'formula'

class OcamlFlac < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-flac/0.1.0/ocaml-flac-0.1.0.tar.gz'
  md5 'cbe73d8494f4db74520f9334c0130c0e'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'flac' => :build
  depends_on 'ocaml-ogg' => :build

  def install
    ENV['OCAMLPATH'] = "#{HOMEBREW_PREFIX}/lib/ocaml/site-lib"
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install"
  end
end
