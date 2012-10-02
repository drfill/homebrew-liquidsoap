require 'formula'

class OcamlCamlimages < Formula
  homepage 'http://gallium.inria.fr/camlimages/'
  url 'https://bitbucket.org/camlspotter/camlimages/get/v4.0.1.tar.gz'
  md5 'd6b9494b56a72b65fd302d1858efff7c'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  #depends_on 'o-make' => :build
  depends_on 'libjpeg' => :build
  depends_on 'libtiff' => :build
  depends_on 'libxpm' => :build
  depends_on 'libpng' => :build
  depends_on 'giflib' => :build
  depends_on 'ghostscript' => :build

  def install
    ENV.j1
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    ENV['OCAMLFIND_LDCONF'] = 'ignore'
    inreplace "OMakefile", "/usr/include/X11", "/usr/include\n  /usr/X11/include\n  #{HOMEBREW_PREFIX}/include/X11"
    inreplace "OMakefile", "/usr/share/X11", "/usr/X11/share/X11"
    system 'omake'
    mkdir_p "#{lib}/ocaml/site-lib"
    system "omake install"
    Dir.glob("#{lib}/ocaml/site-lib/**/*.so").each { |so| mkdir_p "#{lib}/ocaml/stublibs"; mv so, "#{lib}/ocaml/stublibs/" }
  end
end
