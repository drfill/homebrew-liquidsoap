require 'formula'

class Camlimages < Formula
  homepage 'http://gallium.inria.fr/camlimages/'
  url 'https://bitbucket.org/camlspotter/camlimages/get/v4.0.1.tar.gz'
  # head 'https://bitbucket.org/camlspotter/camlimages', :using => :hg #### Does not work with omake... checked: 20.05.2012
  md5 'd6b9494b56a72b65fd302d1858efff7c'

  # TODO: libpng
  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'omake' => :build
  depends_on 'libjpeg' => :build
  depends_on 'libtiff' => :build
  depends_on 'libxpm' => :build
  depends_on 'giflib416' => :build # Old version of giflib is currently supported
  depends_on 'ghostscript' => :build
  
  def install
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    ENV.j1
    inreplace "OMakefile", "/usr/include/X11", "/usr/include\n  /usr/X11/include\n  #{HOMEBREW_PREFIX}/include/X11"
    inreplace "OMakefile", "#{HOMEBREW_PREFIX}/include/X11", "#{HOMEBREW_PREFIX}/include/X11\n  "+Formula.factory('giflib416').include if Formula.factory('giflib').installed?
    inreplace "OMakefile", "LDFLAGS[]+=", "LDFLAGS[]+= -L"+Formula.factory('giflib416').lib if Formula.factory('giflib').installed? 
    inreplace "OMakefile", "/usr/share/X11", "/usr/X11/share/X11"
    system 'omake'
    mkdir_p "#{prefix}/lib/ocaml/site-lib"
    system "omake install"
  end
end
