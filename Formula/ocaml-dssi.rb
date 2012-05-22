require 'formula'

class OcamlDssi < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-dssi/0.1.0/ocaml-dssi-0.1.0.tar.gz'
  md5 '816bdbdf8a4fa842019367d07c3f6ac9'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'ocaml-ladspa' => :build
  depends_on 'dssi' => :build

  def install
    ENV['CFLAGS'] += " -I/usr/local/include -I/usr/local/include/dssi"
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    system "./configure", "--prefix=#{prefix}",
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install"
  end
end
