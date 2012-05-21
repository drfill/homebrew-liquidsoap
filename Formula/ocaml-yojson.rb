require 'formula'

class OcamlYojson < Formula
  homepage 'http://mjambon.com/'
  url 'http://mjambon.com/yojson-1.0.3.tar.gz'
  md5 '9f19c943c9527e18ca624b5cefd79750'

  depends_on 'objective-caml' => :build
  depends_on 'ocaml-findlib' => :build
  depends_on 'ocaml-easy-format' => :build
  depends_on 'ocaml-biniou' => :build
  depends_on 'ocaml-cppo' => :build


  def install
    ENV.j1
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    system 'make'
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make", "install"
  end
end
