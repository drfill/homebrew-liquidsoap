require 'formula'

class OcamlSoundtouch < Formula
  homepage 'http://liquidsoap.fm/'
  url 'http://downloads.sourceforge.net/project/savonet/ocaml-soundtouch/0.1.7/ocaml-soundtouch-0.1.7.tar.gz'
  sha256 'be4d6c3ec944d23def1f08f61f20e466e107f9adf34e6b956651842c70ebd73c'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on "sound-touch" => :build if Hardware::CPU.is_32_bit?
  depends_on "soundtouch" => :build if Hardware::CPU.is_64_bit?

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
