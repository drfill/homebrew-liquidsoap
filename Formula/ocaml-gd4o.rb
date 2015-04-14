require 'formula'

class OcamlGd4o < Formula
  homepage 'http://matt.gushee.net/software/gd4o/'
  url 'http://sourceforge.net/projects/gd4o/files/gd4o/1.0%20Alpha%205/gd4o-1.0a5.tar.gz'
  sha256 'fa10b60a785e6734b6ac1b5a762f496b925502cfc848381cae7dfb75fe547eed'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'freetype' => :build
  depends_on 'libzip' => :build
  depends_on 'jpeg' => :build
  depends_on 'gd' => :build

  def install
    ENV.j1
    ENV.append "OCAMLFIND_DESTDIR", "#{lib}/ocaml/site-lib"
    inreplace "Makefile", "CFLAGS = $(CINCLUDES)", "CFLAGS += $(CINCLUDES)"
    inreplace "Makefile", "CC=gcc", ""
    inreplace "Makefile", "LIBS=", "LIBS=$(LDFLAGS) "
    system "make", "all"
    system "make", "opt"
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make install OCAMLFIND_LDCONF=ignore"
    Dir.glob("#{lib}/ocaml/site-lib/**/*.so").each { |so| mkdir_p "#{lib}/ocaml/stublibs"; mv so, "#{lib}/ocaml/stublibs/" }
  end
end
