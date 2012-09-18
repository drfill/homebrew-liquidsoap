require 'formula'

class OcamlIdl < Formula
  homepage 'http://caml.inria.fr/pub/old_caml_site/camlidl/'
  url 'http://caml.inria.fr/pub/old_caml_site/distrib/bazar-ocaml/camlidl-1.05.tar.gz'
  md5 '4cfb863bc3cbdc1af2502042c45cc675'

  depends_on 'objective-caml' => :build

  def install
    ENV.j1
    cp "config/Makefile.unix", "config/Makefile"
    inreplace "config/Makefile", "OCAMLLIB=/usr/local/lib/ocaml", "OCAMLLIB=#{lib}/ocaml"
    inreplace "config/Makefile", "BINDIR=/usr/local/bin", "BINDIR=#{bin}"
    inreplace "lib/Makefile", "$(OCAMLLIB)", "$(OCAMLLIB)/site-lib/camlidl" 
    system "make all"
    mkdir_p "#{bin}"
    mkdir_p "#{lib}/ocaml/caml"
    mkdir_p "#{lib}/ocaml/site-lib/camlidl"
    system "make install"
    File.open "#{lib}/ocaml/site-lib/camlidl/META", "w" do |f|
      f.write <<END
description = "Stub generator"
version = "1.05"
requires = ""
archive(byte) = "com.cma"
archive(native) = "com.cmxa"
END
    end
  end
end
