require 'formula'

class OcamlBiniou < Formula
  homepage 'https://github.com/mjambon/biniou/tree/v1.0.9/'
  url 'https://github.com/mjambon/biniou/archive/v1.0.9.zip'
  sha256 '65783865ebc07ba6c8af0fcd3dfd0febbf6c67a9face437d70b68ea163096278'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'ocaml-easy-format' => :build

  def install
    ENV.j1
    ENV.append "OCAMLPATH", "#{HOMEBREW_PREFIX}/lib/ocaml/site-lib"
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    system "make clean"
    system "make"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install"
  end
end
