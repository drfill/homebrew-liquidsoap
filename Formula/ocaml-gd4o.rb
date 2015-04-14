require 'formula'

class OcamlGd4o < Formula
  homepage 'http://matt.gushee.net/software/gd4o/'
  url 'http://sourceforge.net/projects/gd4o/files/gd4o/1.0%20Alpha%205/gd4o-1.0a5.tar.gz'
  sha256 '018b1977c4da84efd9eae4169a7eb4d4079aef7b5f9f5d5654b27248fe5c77a9'

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
