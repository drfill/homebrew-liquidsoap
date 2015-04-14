require 'formula'

class OcamlSoundtouch < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-soundtouch/0.1.7/ocaml-soundtouch-0.1.7.tar.gz'
  sha256 'c786eeaf349229e14829bd5013521fccc1a9db12502afb12b311b08c9d8131a0'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on "sound-touch" => :build if Hardware.is_32_bit?
  depends_on "soundtouch" => :build if Hardware.is_64_bit?

  def install
    ENV.j1
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install OCAMLFIND_LDCONF=ignore"
    Dir.glob("#{lib}/ocaml/site-lib/**/*stubs.so").each { |so| mkdir_p "#{lib}/ocaml/stublibs"; mv so, "#{lib}/ocaml/stublibs/" }
  end
end
