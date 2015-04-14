require 'formula'

class OcamlVorbis < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://sourceforge.net/projects/savonet/files/ocaml-vorbis/0.6.1/ocaml-vorbis-0.6.1.tar.gz'
  sha256 '62200e0ed60393994a3e9e0ddc1894aade6ce6733d552edf468721882b95e026'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'ocaml-ogg' => :build
  depends_on 'pkg-config' => :build
  depends_on 'libvorbis' => :build

  def install
    ENV.j1
    ENV.append "OCAMLPATH", "#{HOMEBREW_PREFIX}/lib/ocaml/site-lib"
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    ENV["PKG_CONFIG_LIBDIR"] = "/usr/local/lib/pkgconfig:#{ENV["PKG_CONFIG_LIBDIR"]}"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install OCAMLFIND_LDCONF=ignore"
    Dir.glob("#{lib}/ocaml/site-lib/**/*stubs.so").each { |so| mkdir_p "#{lib}/ocaml/stublibs"; mv so, "#{lib}/ocaml/stublibs/" }
  end
end
