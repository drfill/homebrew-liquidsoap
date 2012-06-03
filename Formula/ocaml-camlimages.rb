require 'formula'

class OcamlCamlimages < Formula
  homepage 'http://gallium.inria.fr/camlimages/'
  url 'https://bitbucket.org/camlspotter/camlimages/get/v4.0.1.tar.gz'
  md5 'd6b9494b56a72b65fd302d1858efff7c'

  # TODO: libpng
  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'omake' => :build
  depends_on 'libjpeg' => :build
  depends_on 'libtiff' => :build
  depends_on 'libxpm' => :build
  depends_on 'giflib' => :build
  depends_on 'ghostscript' => :build
  
  def install
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    ENV['OCAMLFIND_LDCONF'] = 'ignore'
    inreplace "OMakefile", "/usr/include/X11", "/usr/include\n  /usr/X11/include\n  #{HOMEBREW_PREFIX}/include/X11"
    # Waiting for LibPng 1.5 bundled in MacOSX Lion to be supported in CamlImages
    # inreplace "OMakefile", "LDFLAGS[]+=", "LDFLAGS[]+= -L/usr/X11/lib"
    inreplace "OMakefile", "/usr/share/X11", "/usr/X11/share/X11"
    system 'omake'
    mkdir_p "#{prefix}/lib/ocaml/site-lib"
    system "omake install"
    mkdir_p "#{lib}/ocaml/stublibs"
    system "mv #{lib}/ocaml/site-lib/*/*.so #{lib}/ocaml/stublibs"
  end
end
