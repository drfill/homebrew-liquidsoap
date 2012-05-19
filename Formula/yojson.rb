require 'formula'

class Yojson < Formula
  homepage 'http://mjambon.com/'
  url 'http://mjambon.com/yojson-1.0.3.tar.gz'
  md5 '9f19c943c9527e18ca624b5cefd79750'

  depends_on 'objective-caml'
  depends_on 'easy-format'
  depends_on 'biniou'
  depends_on 'ocaml-findlib'

  def install
    ENV.j1
    ENV['OCAMLFIND_DESTDIR'] = "#{lib}/ocaml/site-lib"
    system 'make'
    mkdir_p "#{lib}/ocaml/site-lib"
    system "make", "install"
  end
end
