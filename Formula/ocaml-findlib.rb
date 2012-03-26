require 'formula'

class OcamlFindlib < Formula
  homepage 'http://projects.camlcity.org/projects/findlib.html'
  url 'http://download.camlcity.org/download/findlib-1.2.8.tar.gz'
  md5 'a1da0fddf589ae62fa9b50799cd04c17'

  depends_on 'objective-caml'

  def install
    system './configure', '-config',  "#{prefix}/etc"
    system 'make'
    system "make prefix=#{prefix} OCAML_SITELIB=/lib/ocaml/site-lib \
                 OCAMLFIND_BIN=/bin OCAMLFIND_MAN=/share/man \
                 OCAML_CORE_STDLIB=/lib/ocaml OCAMLFIND_CONF=/etc install"
  end
end
