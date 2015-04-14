require 'formula'

class OcamlXmlm < Formula
  homepage 'http://erratique.ch/software/xmlm'
  url 'http://erratique.ch/software/xmlm/releases/xmlm-1.1.0.tbz'
  sha256 'aeab520565f6769219b1e9b51b4ae4bd152615734ccb74117bfae9cb318a2185'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build

  def install
    ENV.j1
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    system "ocaml setup.ml -configure --prefix #{prefix}"
    system "ocaml setup.ml -build"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "ocaml setup.ml -install"
  end
end
